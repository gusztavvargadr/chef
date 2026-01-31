var configuration = Argument("configuration", string.Empty);
var target = Argument("target", "default");

var configurationParts = configuration.Split('/', StringSplitOptions.RemoveEmptyEntries);
var cookbook = configurationParts.ElementAtOrDefault(0) ?? Argument<string>("cookbook");
var instance = configurationParts.ElementAtOrDefault(1) ?? Argument("instance", string.Empty);
var driver = configurationParts.ElementAtOrDefault(2) ?? Argument("driver", "vagrant");

var cookbookDirectory = Directory($"samples/cookbooks/{cookbook}");
var artifactsDirectory = Directory($"artifacts");

Task("commit-init")
  .Does(() => {
    Chef("--version");
  });

Task("commit-lint")
  .Does(() => {
    Chef("exec", "cookstyle");
  });

Task("commit-build")
  .Does(() => {
    var policyfiles = GetFiles($"{cookbookDirectory}/Policyfile*.rb");
    foreach (var policyfile in policyfiles) {
      var policyfileName = policyfile.GetFilename().ToString();
      
      Chef("install", policyfileName);
      Chef("update", policyfileName, "--attributes");
      Chef("export", policyfileName, MakeAbsolute(artifactsDirectory).ToString(), "--force", "--archive");

      foreach (var archive in GetFiles($"{artifactsDirectory}/*{cookbook.Replace('-', '_')}*-*.tgz")) {
        var archiveTarget = $"{artifactsDirectory}/{string.Join('-', archive.GetFilename().ToString().Split('-').SkipLast(1))}.tgz";
        
        if (FileExists(archiveTarget)) {
          DeleteFile(archiveTarget);
        }
        MoveFile(archive, $"{archiveTarget}");
      }
    }
  });

Task("commit-test")
  .Does(() => {
    Chef("exec", "rspec");
  });

Task("commit-clean")
  .Does(() => {
    CleanDirectory(artifactsDirectory);
  });

Task("commit")
  .IsDependentOn("commit-init")
  .IsDependentOn("commit-lint")
  .IsDependentOn("commit-build")
  .IsDependentOn("commit-test");

Task("acceptance-init")
  .Does(() => {
    Chef("--version");
    Kitchen("--version");

    Kitchen("list", instance);
  });

Task("acceptance-create")
  .Does(() => {
    try {
      Kitchen("create", instance);
    } catch (Exception) {
      Kitchen("create", instance);
      throw;
    }
  });

Task("acceptance-converge")
  .Does(() => {
    try {
      Kitchen("converge", instance);
    } catch (Exception) {
      Kitchen("create", instance);
      throw;
    }
  });

Task("acceptance-verify")
  .Does(() => {
    try {
      Kitchen("verify", instance);
    } catch (Exception) {
      Kitchen("create", instance);
      throw;
    }
  });

Task("acceptance-test")
  .Does(() => {
    try {
      Kitchen("test", instance);
    } catch (Exception) {
      Kitchen("create", instance);
      throw;
    }
  });

Task("acceptance-clean")
  .Does(() => {
    Kitchen("destroy", instance);
  });

Task("acceptance")
  .IsDependentOn("acceptance-init")
  .IsDependentOn("acceptance-test");

Task("clean")
  .IsDependentOn("commit-clean")
  .IsDependentOn("acceptance-clean");

Task("all")
  .IsDependentOn("commit")
  .IsDependentOn("acceptance");

Task("default")
  .IsDependentOn("commit");

RunTarget(target);

void Chef(params string[] arguments) {
  var result = StartProcess("chef", new ProcessSettings {
    Arguments = ProcessArgumentBuilder.FromStrings(arguments),
    WorkingDirectory = cookbookDirectory
  });
  
  if (result != 0) {
    throw new Exception($"Chef failed with code {result} .");
  }
}

void Kitchen(params string[] arguments) {
  var executable = IsRunningOnWindows() ? @"C:\opscode\chef-workstation\bin\kitchen.bat" : "kitchen";

  var result = StartProcess(executable, new ProcessSettings {
    Arguments = ProcessArgumentBuilder.FromStrings(arguments),
    WorkingDirectory = cookbookDirectory,
    EnvironmentVariables = new Dictionary<string, string> {
      { "KITCHEN_GLOBAL_YAML", $"../../../src/kitchen.{driver}.yml" }
    },
  });
  
  if (result != 0) {
    throw new Exception($"Kitchen failed with code {result} .");
  }
}
