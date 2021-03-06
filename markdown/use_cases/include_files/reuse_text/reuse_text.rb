require_relative '../include_use_case'

class ReuseText < IncludeUseCase

  def self.build

    use_case_name = File.basename(__FILE__, '.rb')
    use_case = self.new(use_case_name)

    use_case.write_includee_file
    use_case.write_includer_file
    use_case.write_ruby_file(pristine = true)

    File.write(
        TEMPLATE_FILE_NAME,
        <<EOT
### Reuse Text

Use file inclusion to stay DRY (Don't Repeat Yourself).

Maintain reusable text in a separate file, then include it wherever it's needed.

#### File To Be Included

@[markdown](#{INCLUDEE_FILE_NAME})

#### Includer File

@[markdown](#{INCLUDER_FILE_NAME})

The treatment token ```:markdown``` specifies that the included text is to be treated as more markdown.

@[:markdown](../interface.md)

#### File with Inclusion

Here's the output file, after inclusion.

@[markdown](#{INCLUDED_FILE_NAME})
EOT
    )

    use_case.build

  end

end
