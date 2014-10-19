module LanguageRecognizer
require 'set'

LANG_LIST = 

[

  {terms: ['c[\s]?++'], language: 'C++'},

  {terms: ['assembly', 'z80', 'x86', '(?<![a-zA-Z])asm[\. ,]+(?!js)'], language: 'Assembly'},

  {terms: ['ruby', '(?<![a-zA-Z])ror(?![a-zA-Z])', '(?<![a-zA-Z])rails', 'sinatra'], language: 'Ruby'},

  {terms: ['python', 'django', 'flask', 'scipy', 'numpy'], language: 'Python'},

  {terms: ['javascript', 'java[\s-]?script', 'js', 'angular', 'node', 'jquery', 'meteor', 'ember', 'coffee[\s-]?script'], language: 'Javascript'},

  {terms: ['php', 'symfony', 'codeigniter', 'laravel', 'yii'], language: 'PHP'},

  {terms: ['(?<![a-zA-Z])perl(?![a-zA-Z])'], language: 'Perl'},

  {terms: ['java', 'spring', 'j2ee', 'play', 'swing', 'applet'], language: 'Java'},

  {terms: ['(?<![gt]o.|[a-zA-Z])go(?![a-zA-Z]|.[gt]o|.getter)'], language: 'Go'},

  {terms: ['(?<![a-zA-Z])c#'], language: 'C#'},

  {terms: ['objective[^a-zA-Z\n]{0,3}c(?![a-zA-Z])'], language: 'Objective C'},

  {terms: ['(?<![a-zA-Z])c(?![a-zA-Z])'], language: 'C'},

  {terms: ['erlang'], language: 'Erlang'},

  {terms: ['ocaml', '(?<![a-zA-Z])o[^a-zA-Z]caml'], language: 'OCaml'},

  {terms: ['cold[\s-]?fusion'], language: 'ColdFusion'},

  {terms: ['haskell'], language: 'Haskell'},

  {terms: ['fortran'], language: 'Fortran'},

  {terms: ['cobol'], language: 'Cobol'},

  {terms: ['lisp'], language: 'Lisp'},

  {terms: ['scheme'], language: 'Scheme'},

  {terms: ['scala(?![a-zA-Z])'], language: 'Scala'},

  {terms: ['matlab'], language: 'MATLAB'},

  {terms: ['octave'], language: 'GNU Octave'},

  {terms: ['pascal'], language: 'Pascal'},

  {terms: ['clojure'], language: 'Clojure'},

  {terms: ['groovy', 'grails'], language: 'Groovy'},

  {terms: ['power[\s-]?shell', '(?<![a-zA-Z])ms[-\s]?shell', 'microsoft shell', 'windows? shell', '(?<![a-zA-Z]dos shell'], language: 'Microsoft shell scripting'},

  {terms: ['bash', 'shell', 'zsh', 'ksh', 'bourne'], language: 'Linux/Unix shell scripting'}

]

def self.recognize(str)
  results = Set.new
  str.downcase!
  LANG_LIST.each do |lang|
    re = Regexp.union lang[:terms]
    newstr = str.gsub(re, ' ')
    results.add(lang[:language]) if str != newstr
    str = newstr
  end

  results
end

end
