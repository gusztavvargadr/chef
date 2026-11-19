#!/usr/bin/env bash

# Installs Cinc Client where no client is installed, then runs a chef policy in local mode.
# Usage: curl -fsSL https://github.com/gusztavvargadr/chef/releases/latest/download/provision.sh | sudo CHEF_POLICY=<policy> bash
# Without sudo, it runs where a client is already installed.

set -euo pipefail

# The body is one function, called on its last line, so a download cut short is a syntax error instead of a partial run.
main() {
  CHEF_VERSION="${CHEF_VERSION:-18}"
  CHEF_POLICY="${CHEF_POLICY:-}"
  CHEF_POLICY_URL="${CHEF_POLICY_URL:-https://github.com/gusztavvargadr/chef/releases/latest/download/${CHEF_POLICY}.tgz}"
  CHEF_POLICY_PATH="${CHEF_POLICY_PATH:-}"
  CHEF_ATTRIBUTES="${CHEF_ATTRIBUTES:-default}"
  CHEF_RUN_LIST="${CHEF_RUN_LIST:-}"

  export CHEF_LICENSE="accept-silent"

  if [ -x /opt/cinc/bin/cinc-client ]; then
    client=/opt/cinc/bin/cinc-client
  elif [ -x /opt/chef/bin/chef-client ]; then
    client=/opt/chef/bin/chef-client
  else
    if [ "$(id -u)" -ne 0 ]; then
      echo "No client is installed, and installing Cinc Client needs root. Run provision.sh with sudo." >&2
      exit 1
    fi
    echo "Installing Cinc Client ${CHEF_VERSION}."
    curl -fsSL https://omnitruck.cinc.sh/install.sh | bash -s -- -P cinc -v "${CHEF_VERSION}"
    client=/opt/cinc/bin/cinc-client
  fi
  echo "Using ${client}."
  "${client}" --version

  if [ -z "${CHEF_POLICY}" ] && [ -z "${CHEF_POLICY_PATH}" ]; then
    echo "No CHEF_POLICY or CHEF_POLICY_PATH set, so no policy runs."
    exit 0
  fi

  temp_dir=""
  cleanup() {
    if [ -n "${temp_dir}" ]; then
      cd /
      rm -rf "${temp_dir}"
    fi
  }
  trap cleanup EXIT

  if [ -n "${CHEF_POLICY_PATH}" ] && [ -d "${CHEF_POLICY_PATH}" ]; then
    policy_dir="${CHEF_POLICY_PATH}"
  else
    temp_dir="$(mktemp -d)"

    if [ -n "${CHEF_POLICY_PATH}" ]; then
      if [ ! -f "${CHEF_POLICY_PATH}" ]; then
        echo "CHEF_POLICY_PATH ${CHEF_POLICY_PATH} is neither a directory nor a file." >&2
        exit 1
      fi
      archive="${CHEF_POLICY_PATH}"
    else
      archive="${temp_dir}/policy.tgz"
      echo "Downloading ${CHEF_POLICY_URL}."
      curl -fsSL -o "${archive}" "${CHEF_POLICY_URL}"
    fi

    policy_dir="${temp_dir}/policy"
    mkdir -p "${policy_dir}"
    tar -xzf "${archive}" -C "${policy_dir}"
  fi

  cd "${policy_dir}"

  run_options=(--local-mode --config .chef/config.rb)
  if [ -f "attributes.${CHEF_ATTRIBUTES}.json" ]; then
    run_options+=(--json-attributes "attributes.${CHEF_ATTRIBUTES}.json")
  fi
  if [ -n "${CHEF_RUN_LIST}" ]; then
    run_options+=(--named-run-list "${CHEF_RUN_LIST}")
  fi

  echo "Running ${client} ${run_options[*]} in ${policy_dir}."
  set +e
  "${client}" "${run_options[@]}"
  exit_code=$?
  set -e

  exit "${exit_code}"
}; main "$@"
