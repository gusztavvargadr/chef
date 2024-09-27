              // - script: |
              //     vagrant --version
              //     vagrant plugin list

              //     vagrant box list
              //     vagrant global-status --prune
              //   displayName: Initialize Vagrant


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
  .IsDependentOn("commit-test");

Task("acceptance-init")
  .Does(() => {
    Kitchen("--version");

    Kitchen("list", instance);
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
    try {
      Kitchen("destroy", instance);
    } finally {
      CleanDirectory(artifactsDirectory);
    }
  });

Task("acceptance")
  .IsDependentOn("acceptance-init")
  .IsDependentOn("acceptance-test");

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
      { "KITCHEN_YAML", $"kitchen.{driver}.yml" }
    },
  });
  
  if (result != 0) {
    throw new Exception($"Kitchen failed with code {result} .");
  }
}
