{ pkgs, ... }:
{
    # VS Code setup
    environment.systemPackages =
        with pkgs; [
            (vscode-with-extensions.override {
                vscode = vscodium;
                vscodeExtensions = with vscode-extensions; [
                    bbenoist.nix
                    arrterian.nix-env-selector
                    ms-python.python
                    yzhang.markdown-all-in-one
                    ms-azuretools.vscode-docker
                    ms-vscode-remote.remote-ssh
                ];
            })
            python312Packages.python-lsp-server
        ];
}
