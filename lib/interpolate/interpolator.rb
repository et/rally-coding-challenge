module Interpolate

  class Interpolator
    VARIABLE_MATCH_RE = /\$\{(\w+)\}/

    def substitute mapping, template
      template.gsub VARIABLE_MATCH_RE do |match|
        key = $1
        raise ArgumentError unless mapping.has_key? key
        mapping[key]
      end
    end
  end
end
