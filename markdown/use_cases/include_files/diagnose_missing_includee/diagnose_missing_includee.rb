require_relative '../include_use_case'

class DiagnoseMissingIncludee < IncludeUseCase

  def self.build

    use_case_name = File.basename(__FILE__, '.rb')
    use_case = self.new(use_case_name)

    use_case.write_ruby_file(pristine = true)

    [
        [0, 1],
        [1, 2],
        [2, 3],
    ].each do |indexes|
      includer_index, includee_index = *indexes
      includer_file_name = "includer_#{includer_index}.md"
      includee_file_name = "includer_#{includee_index}.md"
      if includer_index == 0
        include_description = "@[:markdown](#{includer_file_name})\n"
        File.write(INCLUDER_FILE_NAME, include_description)
      end
      include_description = "@[:markdown](#{includee_file_name})\n"
      File.write(includer_file_name, include_description)
    end

    File.write(
        TEMPLATE_FILE_NAME,
        <<EOT
### Diagnose Missing Includee

Use the backtrace of inclusions to diagnose and correct a missing or otherwise unreadable includee file.

The backtrace is especially useful for errors in nested includes.

#### Files To Be Included

These files demonstrate nested inclusion, with a missing includee file.

@[markdown](includer_0.md)

@[markdown](includer_1.md)

@[markdown](includer_2.md)

#### Includer File

This file initiates the nested inclusions.

@[markdown](#{INCLUDER_FILE_NAME})

@[:markdown](../interface.md)

#### Error and Backtrace

Here's the resulting backtrace of inclusions.

@[:code_block](diagnose_missing_includee.err)
EOT
    )

    use_case.build

  end

end
