{ pkgs, ... }: {
  home.packages = with pkgs;
    with rubyPackages; [
      ruby
      pry-byebug

      # formatters
      # rubocop
      rubyfmt

      # LSP
      solargraph
      # ruby-lsp
      sorbet-runtime # type checker
    ];
}
