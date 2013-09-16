module Interpolate

  class Interpolator

    VARIABLE_MATCH_RE = Regexp.union(
      /\$\$/,
      /\$\{(\w+)\}/
    )

    class << self

      # Replaces a template with a mapping of variables
      #
      # template - The String to be substituted
      # mapping  - The Hash of key/value pairs
      #
      # Examples
      #
      # substitute "${food} is ${adjective}", { 'food' => 'pizza', 'adjective' => 'rad' }
      # => 'pizza is rad'
      #
      # Returns the substituted String.
      def substitute template, mapping
        template.gsub VARIABLE_MATCH_RE do |match|
          if match == '$$'
            '$'
          else
            key = $1
            raise ArgumentError unless mapping.has_key? key
            mapping[key]
          end
        end
      end
    end
  end
end
