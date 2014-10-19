module LanguageRecognizer
require 'set'

LANG_LIST = 

[

  {terms: [/c[\s]?\+\+/], language: 'C++', abbrev: 'cplusplus'},

  {terms: [/assembly/, /z80/, /x86/, /(?<![a-zA-Z])asm[\. ,]+(?!js)/], language: 'Assembly', abbrev: 'assembly'},

  {terms: [/ruby/, /(?<![a-zA-Z])ror(?![a-zA-Z])/, /(?<![a-zA-Z])rails/, /sinatra/], language: 'Ruby', abbrev: 'ruby'},

  {terms: [/python/, /django/, /flask/, /scipy/, /numpy/], language: 'Python', abbrev: 'python'},

  {terms: [/javascript/, /java[\s-]?script/, /js/, /angular/, /node/, /jquery/, /meteor/, /ember/, /coffee[\s-]?script/], language: 'Javascript', abbrev: 'javascript'},

  {terms: [/php/, /symfony/, /codeigniter/, /laravel/, /yii/], language: 'PHP', abbrev: 'php'},

  {terms: [/(?<![a-zA-Z])perl(?![a-zA-Z])/], language: 'Perl', abbrev: 'perl'},

  {terms: [/java/, /spring/, /j2ee/, /play/, /swing/, /applet/], language: 'Java', abbrev: 'java'},

  {terms: [/(?<![gt]o.|[a-zA-Z])go(?![a-zA-Z]|.[gt]o|.getter)/], language: 'Go', abbrev: 'go'},

  {terms: [/(?<![a-zA-Z])c#/], language: 'C#', abbrev: 'csharp'},

  {terms: [/objective[^a-zA-Z\n]{0,3}c(?![a-zA-Z])/], language: 'Objective C', abbrev: 'objectivec'},

  {terms: [/(?<![a-zA-Z])c(?![a-zA-Z])/], language: 'C', abbrev: 'clang'},

  {terms: [/erlang/], language: 'Erlang', abbrev: 'erlang'},

  {terms: [/ocaml/, /(?<![a-zA-Z])o[^a-zA-Z]caml/], language: 'OCaml', abbrev: 'ocaml'},

  {terms: [/cold[\s-]?fusion/], language: 'ColdFusion', abbrev: 'coldfusion'},

  {terms: [/haskell/], language: 'Haskell', abbrev: 'haskell'},

  {terms: [/fortran/], language: 'Fortran', abbrev: 'fortran'},

  {terms: [/cobol/], language: 'Cobol', abbrev: 'cobol'},

  {terms: [/lisp/], language: 'Lisp', abbrev: 'lisp'},

  {terms: [/scheme/], language: 'Scheme', abbrev: 'scheme'},

  {terms: [/scala(?![a-zA-Z])/], language: 'Scala', abbrev: 'scala'},

  {terms: [/matlab/], language: 'MATLAB', abbrev: 'matlab'},

  {terms: [/octave/], language: 'GNU Octave', abbrev: 'octave'},

  {terms: [/pascal/], language: 'Pascal', abbrev: 'pascal'},

  {terms: [/clojure/], language: 'Clojure', abbrev: 'clojure'},

  {terms: [/groovy/, /grails/], language: 'Groovy', abbrev: 'groovy'},

  {terms: [/power[\s-]?shell/, /(?<![a-zA-Z])ms[-\s]?shell/, /microsoft shell/, /windows? shell/, /(?<![a-zA-Z])dos shell/], language: 'Microsoft shell scripting', abbrev: 'msshell'},

  {terms: [/bash/, /shell/, /zsh/, /ksh/, /bourne/], language: 'Linux/Unix shell scripting', abbrev: 'unixshell'}

]

def self.recognize(str)
  results = Set.new
  str.downcase!
  LANG_LIST.each do |lang|
    re = Regexp.union(lang[:terms])
    newstr = str.gsub(re, ' ')
    results.add(lang[:language]) if str != newstr
    str = newstr
  end

  results
end

end
