class AddSomeCountsAndLastFetchedToClSites < ActiveRecord::Migration
  def change
    add_column :cl_sites, :last_fetched, :datetime
    add_column :cl_sites, :total_entries, :int, default: 0, null: false
    add_column :cl_sites, :no_matches, :int, default: 0, null: false
    ["cplusplus", "assembly", "ruby", "python", "javascript", "php", "perl", "java", "go", "csharp", "objectivec", "clang", "erlang", "ocaml", "coldfusion", "haskell", "fortran", "cobol", "lisp", "scheme", "scala", "matlab", "octave", "pascal", "clojure", "groovy", "msshell", "unixshell"].each do |lang|
      add_column :cl_sites, lang, :int, default: 0, null: false
    end
  end
end
