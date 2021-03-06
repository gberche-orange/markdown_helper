<!-- >>>>>> BEGIN GENERATED FILE (include): SOURCE README.template.md -->
# Markdown Helper

[![Gem](https://img.shields.io/gem/v/markdown_helper.svg?style=flat)](http://rubygems.org/gems/markdown_helper "View this project in Rubygems")

## What's New?

Treatments for included file:

- Support is added for including a file as a comment.  See the [use case](markdown/use_cases/include_files/include_text_as_comment/use_case.md#include-text-as-comment).
- Support is added for including a file as pre-formatted.  See the [use case](markdown/use_cases/include_files/include_text_as_pre/use_case.md#include-text-as-pre).

(The new version, 2.0.0, is not a major increment over version 1.9.9.  Numbers just ran out.)

## What's a Markdown Helper?

Class <code>MarkdownHelper</code> supports:

* [File inclusion](#file-inclusion): to include text from other files, as code-block or markdown.
* [Page TOC](#page-toc): to create the table of contents for a markdown page.

## How It Works

The markdown helper is a preprocessor that reads a markdown document (template) and writes another markdown document.

The template can contain certain instructions that call for file inclusions.

### Restriction:  ```git``` Only

The helper works only in a ```git``` project:  the working directory or one of ita parents must be a git directory -- one in which command ```git rev-parse --git-dir``` succeeds.

### Commented or Pristine?

By default, the output markdown has added comments that show:

* The path to the template file.
* The path to each included file.

You can suppress those comments using the <code>pristine</code> option.

## File Inclusion 

<img src="images/include.png" alt="include_icon" width="50">

This markdown helper enables file inclusion in GitHub markdown.

(Actually, this README file itself is built using file inclusion.)

Use the markdown helper to merge external files into a markdown (</code>.md</code>) file.

See the [use cases](markdown/use_cases/use_cases.md#use-cases).

### Merged Text Formats

#### Highlighted Code Block

<!-- >>>>>> BEGIN INCLUDED FILE (ruby): SOURCE markdown/readme/include.rb -->
```include.rb```:
```ruby
class RubyCode
  def initialize
    raise RuntimeError.new('I am only an example!')
  end
end
```
<!-- <<<<<< END INCLUDED FILE (ruby): SOURCE markdown/readme/include.rb -->

#### Plain Code Block

<!-- >>>>>> BEGIN INCLUDED FILE (code_block): SOURCE markdown/readme/include.rb -->
```include.rb```:
```
class RubyCode
  def initialize
    raise RuntimeError.new('I am only an example!')
  end
end
```
<!-- <<<<<< END INCLUDED FILE (code_block): SOURCE markdown/readme/include.rb -->

[Note:  In the gem documentation, RubyDoc.info chooses to highlight this code block regardless.  Go figure.]

#### Comment

Comment text is written into the output between the comment delimiters <code>\<!--</code> and <code>--></code>

#### Markdown

Markdown text is included unadorned, and will be processed on GitHub as markdown.

The markdown text is itself scanned for nested includes.

### Usage

#### CLI

<!-- >>>>>> BEGIN INCLUDED FILE (code_block): SOURCE bin/usage/include.txt -->
```include.txt```:
```

Usage: markdown_helper include [options] template_file_path markdown_file_path
        --pristine                   No comments added
        --help                       Display help
    
  where

    * template_file_path is the path to an existing file.
    * markdown_file_path is the path to a file to be created.

  Typically:

    * Both file types are .md.
    * The template file contains file inclusion descriptions.
```
<!-- <<<<<< END INCLUDED FILE (code_block): SOURCE bin/usage/include.txt -->

#### API

<!-- >>>>>> BEGIN INCLUDED FILE (ruby): SOURCE markdown/readme/include_usage.rb -->
```include_usage.rb```:
```ruby
require 'markdown_helper'

template_file_path = 'highlight_ruby_template.md'
markdown_file_path = 'highlighted_ruby.md'
markdown_helper = MarkdownHelper.new
markdown_helper.include(template_file_path, markdown_file_path)
# Pristine.
markdown_helper.pristine = true
markdown_helper.include(template_file_path, markdown_file_path)
# Also pristine.
markdown_helper = MarkdownHelper.new(:pristine => true)
markdown_helper.include(template_file_path, markdown_file_path)
```
<!-- <<<<<< END INCLUDED FILE (ruby): SOURCE markdown/readme/include_usage.rb -->

#### Include Descriptions

Specify each file inclusion at the beginning of a line via an *include description*, which has the form:

<code>@[</code>*format*<code>]\(</code>*relative_file_path*<code>)</code>

where:

* *format* (in square brackets) is one of the following:
  * Highlighting mode such as <code>[ruby]</code>, to include a highlighted code block.  This can be any Ace mode mentioned in [GitHub Languages](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml).
  * <code>[:code_block]</code>, to include a plain code block.
  * <code>[:markdown]</code>, to include text markdown (to be rendered as markdown).
* *relative_file_path* points to the file to be included.

##### Example Include Descriptions

<!-- >>>>>> BEGIN INCLUDED FILE (code_block): SOURCE markdown/readme/include.md -->
```include.md```:
```code_block
@[ruby](my_ruby.rb)

@[:code_block](my_language.xyzzy)

@[:markdown](my_markdown.md)
```
<!-- <<<<<< END INCLUDED FILE (code_block): SOURCE markdown/readme/include.md -->

## Page TOC

The markdown helper can create the table of contents for a markdown page.
- The TOC is a tree of links to the headers on the page, suitable for inclusion with the page itself.
- See the [use case](markdown/use_cases/tables_of_contents/create_and_include_page_toc/use_case.md#create-and-include-page-toc).

## What Should Be Next?

I have opened some enhancement Issues in the GitHub [markdown_helper](https://github.com/BurdetteLamar/markdown_helper) project:

* [Project TOC](https://github.com/BurdetteLamar/markdown_helper/issues/37):  table of contents of all markdown pages in project.
* [Partial file inclusion](https://github.com/BurdetteLamar/markdown_helper/issues/38):  including only specified lines from a file (instead of the whole file).
* [Ruby-entity inclusion](https://github.com/BurdetteLamar/markdown_helper/issues/39):  like file inclusion, but including a Ruby class, module, or method.
* [Pagination](https://github.com/BurdetteLamar/markdown_helper/issues/40):  series of markdown pages connected by prev/next navigation links.

Feel free to comment on any of these, or to add more Issues (enhancement or otherwise).
<!-- <<<<<< END GENERATED FILE (include): SOURCE README.template.md -->
