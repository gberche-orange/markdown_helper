require_relative '../include_use_case'

class IncludeGeneratedText < IncludeUseCase

  def self.build

    use_case_name = File.basename(__FILE__, '.rb')
    use_case = self.new(use_case_name)

    use_case.files_to_write.store(
        TEMPLATE_FILE_NAME,
        <<EOT
### Include Generated Text

#### Generate Includable Text

A handy use of file inclusion is seen in including generated text.

That is, the markdown "build" generates files that are then included in the finished markdown document.

The use cases documented here take advantage of that.  Each use case has an executable Ruby file that has [Here Documents](https://ruby-doc.org/core-2.2.0/doc/syntax/literals_rdoc.html#label-Here+Documents) containing all the relevant text.  The build emits the files that are them used to illustrate the use case.

#### Keeping Example Code "Green"

An especially handy use of file inclusion is seen in including example code and output.

1.  Example code in its own file is executed, and its output captured into another file.
2.  Then both are included in markdown that uses the example.

Running the example each time the markdown is built keeps the example code "green," because it confirms that the code still works.
EOT
    )

    use_case.build

  end

end
