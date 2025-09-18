/*
See Guides:
https://jnsgr.uk/2024/04/nixos-secure-boot-tpm-fde/
https://oddlama.org/blog/bypassing-disk-encryption-with-tpm2-unlock/#
Solving security vulnerability:
https://oddlama.org/blog/bypassing-disk-encryption-with-tpm2-unlock/#crude-implementation-of-pcr15-verification
https://forge.lel.lol/patrick/nix-config/src/commit/ab2cb2b4d554040ce208fc60624fe729a9d5e32b/modules/ensure-pcr.nix
*/
# Commands:
# sudo systemd-cryptenroll --tpm2-device=list
# sudo systemd-cryptenroll --tpm2-pcrs=0+2+7+12 --wipe-slot=tpm2 [DEVICE]
{ pkgs, ... }:
{
  security.tpm2.enable = true;
  security.tpm2.pkcs11.enable = true; # expose /run/current-system/sw/lib/libtpm2_pkcs11.so
  security.tpm2.tctiEnvironment.enable = true; # TPM2TOOLS_TCTI and TPM2_PKCS11_TCTI env variables
  environment.systemPackages = with pkgs; [ sbctl ]; # for secure boot debugging
}
