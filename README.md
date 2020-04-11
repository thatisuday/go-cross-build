# GitHub Action: go-build-action
This actions generates cross-platform executable files from a Go module.

![release](/assets/release.png)

# Workflow setup

```yaml
# workflow name
name: Generate release-artifacts

# on events
on:
  release:
    types: 
        - created

# workflow tasks
jobs:
  generate:
    name: Generate cross-platform builds
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the repository
        uses: actions/checkout@v2
      - name: Generate build files
        uses: thatisuday/go-cross-build@v1
        with:
            platforms: 'linux/amd64, darwin/amd64, windows/amd64'
            package: 'demo'
            name: 'program'
            compress: 'true'
            dest: 'dist'
```

### option: **platforms**
The `platforms` option specifies comma-separated platform names to create binary-executable files for. To see the list of supported platforms, use `go tool dist list` command.

### option: **package**
If the module (_repository_) itself is a Go package, then `package` option value should be an empty string (''). If the repository contains a package directory, then `package` value should be the directory name.

### option: **compress**
The `compress` option if set to `'true'` will generate **compressed-tar** archive files for the each platform-build file. The resulting archive file also contains `README.md` and `LICENSE` file if they exist inside the root of the repository. In this mode, the binary executable file name is taken from the `name` option value.

### option: **name**
The `name` option sets a prefix for the build filenames. In compression mode, this prefix is applied to archive files and binary executable filename is set to this value.

### option: **dest**
The `dest` option sets the output directory for the build files. This should be a relative directory without leading `./`.