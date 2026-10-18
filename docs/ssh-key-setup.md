# Set up Secure Enclave SSH keys

Use a separate, non-exportable SSH key on each Mac. These instructions target macOS Tahoe (26) or later on a Mac with a Secure Enclave and Touch ID. Run `make install` from this repo before you start.

The key cannot be moved to another Mac. Before relying on it, keep another way to recover access to GitHub and your servers.

## Create and register the key

1. Create a key protected by Touch ID:

   ```sh
   sc_auth create-ctk-identity -l ssh -k p-256-ne -t bio
   ```

2. In an empty directory outside this repo, export the SSH reference and public key:

   ```sh
   ssh-keygen -w /usr/lib/ssh-keychain.dylib -K -N ""
   ```

   When prompted for a PIN, press Enter. Approve Touch ID when prompted. The reference file contains no private key material.

3. Move the generated reference file to `~/.ssh/id_ecdsa_sk` and its `.pub` file to `~/.ssh/id_ecdsa_sk.pub`. Do not overwrite existing keys. Use the filenames reported by `ssh-keygen`, such as `id_ecdsa_sk_rk_ssh`. Keep both files outside this repo.

4. Register `~/.ssh/id_ecdsa_sk.pub` with GitHub as an **Authentication Key**, and add it to any servers you use.

5. Verify GitHub access:

   ```sh
   ssh -T git@github.com
   ```

   GitHub reports successful authentication and exits with status 1 because it does not provide shell access. The configured `id_ed25519` key remains a fallback, so this command alone does not prove that SSH used the new key.

## How it works

SSH asks the Secure Enclave to sign a challenge after you approve Touch ID. GitHub or the server checks the signature against your public key. Software cannot copy the private key to another computer, and you can revoke each Mac's access separately.

The SSH config selects Apple's provider. Fish also exports `SSH_SK_PROVIDER` so that `ssh-add` and `ssh-keygen` use it.
