{ pkgs, ... }: {
  home.packages = with pkgs;
    with rubyPackages; [
      ruby
      pry-byebug

      rubocop
      # rubyfmt

      # ruby-lsp
      solargraph
      sorbet-runtime # type checker
    ];
}
