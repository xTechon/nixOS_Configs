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
                    ms-python.debugpy
                    ms-python.vscode-pylance
                    ms-python.pylint
                    yzhang.markdown-all-in-one
                    ms-azuretools.vscode-docker
                    ms-vscode-remote.remote-ssh
                    xaver.clang-format
                    llvm-vs-code-extensions.vscode-clangd
                    asvetliakov.vscode-neovim
                    vadimcn.vscode-lldb
                ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "explicit-folding";
        publisher = "zokugun";
        version = "0.24.1";
        sha256 = "b0625f68404f7beef2735686132918a47b54e381469c27609ec3ab5129ea242e";
      }
    ];
            })
            python312Packages.python-lsp-server
        ];
    programs.neovim.enable = true;
}
