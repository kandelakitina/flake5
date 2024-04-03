{ pkgs, lib, ... }:
{
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      settings = {
        username = {
          style_user = "blue bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };
        hostname = {
          ssh_only = true;
          ssh_symbol = "🌐 ";
          format = "on [$hostname](bold red) ";
          trim_at = ".local";
          disabled = false;
        };
        cmd_duration = {
          disabled = true;
        };
        directory = {
          truncate_to_repo = true;
          format = "at [$path]($style)[$read_only]($read_only_style) ";
        };
        
	    aws.symbol = " ";
	    conda.symbol = " ";
	    dart.symbol = " ";
	    directory.read_only = " ";
	    docker_context.symbol = " ";
	    elm.symbol = " ";
	    elixir.symbol = "";
	    gcloud.symbol = " ";
	    git_branch.symbol = " ";
	    golang.symbol = " ";
	    hg_branch.symbol = " ";
	    java.symbol = " ";
	    julia.symbol = " ";
	    memory_usage.symbol = "󰍛 ";
	    nim.symbol = "󰆥 ";
	    nodejs.symbol = " ";
	    package.symbol = "󰏗 ";
	    perl.symbol = " ";
	    php.symbol = " ";
	    python.symbol = " ";
	    ruby.symbol = " ";
	    rust.symbol = " ";
	    scala.symbol = " ";
	    shlvl.symbol = "";
	    swift.symbol = "󰛥 ";
	    terraform.symbol = "󱁢";
      };
    };
}
