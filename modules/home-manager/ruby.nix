{ pkgs, ... }: {
  home.packages = with pkgs;
    with rubyPackages; [
      ruby
      # rubyfmt
      # ruby-lsp
      rubocop
      solargraph
    ];
}
