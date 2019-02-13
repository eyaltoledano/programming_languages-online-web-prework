require 'pry'

# Expected hash
# {
#   :ruby => {
#    :type => "interpreted",
#    :style => [:oo]
#   },
#   :javascript => {
#     :type => "interpreted",
#     :style => [:oo, :functional]
#   },
#   :python => {
#     :type => "interpreted",
#     :style => [:oo]
#   },
#   :java => {
#     :type => "compiled",
#     :style => [:oo]
#   },
#   :clojure => {
#     :type => "compiled",
#     :style => [:functional]
#   },
#   :erlang => {
#     :type => "compiled",
#     :style => [:functional]
#   },
#   :scala => {
#     :type => "compiled",
#     :style => [:functional]
#   }
# }


def reformat_languages(languages)
  new_hash = {}

  languages.each do |master_type, languages|
    languages.each do |language, attributes|
      attributes.each do |type, type_value|
        new_hash[language] = {type => type_value}
        p_language = new_hash[language]
        p_language[:style] = [master_type]
      end
    end
  end

  new_hash.each do |language, data|
    if language == :javascript
      data.each do |attribute, value|
        if attribute == :style
          value.unshift(:oo)
        end
      end
    end
  end

  new_hash
end
