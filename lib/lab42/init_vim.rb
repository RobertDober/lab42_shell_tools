require 'lab42/rgxargs'

module Lab42
  class InitVim
    attr_reader :args, :options, :positionals

    def run
      _directives +
      _commands
        .map{ |cmd| [':tabnew', cmd] }.flatten.drop(1)
    end



    private

    #
    #  Init
    #
    def initialize args
      @args        = parser.parse(args)
      @options     = @args.first
      @positionals = @args[1]
    end

    #
    #  Memos
    #
    def parser
      @__parser__ ||= Lab42::Rgxargs.new
    end

    #
    #  Workers
    #
    def _commands
      _from_input +
        _from_positionals
    end
    def _directives
      _from_options
    end
    def _from_input
      $stdin
        .readlines(chomp: true)
        .map(&method(:_from_positional))
    end
    def _from_options
      [
        options[:cs] ? ":colorscheme #{options[:cs]}" : nil 
      ]
    end

    def _from_positional arg
      if File.directory? arg
        return [":NERDTree #{arg}"]
      end
      x, y, _ = arg.split(":")
      if File.readable? x
        return _open_file(x, y)
      end
    end

    def _from_positionals
      positionals.map(&method(:_from_positional))
    end

    def _open_file(fn, ln)
      unless ln
        return [":edit #{fn}"]
      end
      return [":edit #{fn}", %{:exe "normal #{ln}G"}]
    end
  end
end
