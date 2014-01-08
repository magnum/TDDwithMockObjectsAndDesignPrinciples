require "minitest/autorun"
require 'minitest/spec'
require_relative './unicode_file_to_html_text_converter'

class UnicodeFileToHtmlTextConverterTest < Minitest::Test


  def test_do_something
    converter = UnicodeFileToHtmTextConverter.new('./test_file.txt')
    html = converter.convert_to_html
    #assert_equal "Consuetudium lectorum mirum est notare quam littera gothica quam<br />", html
    assert_match /<br \/>$/, html
  end

  def test_do_something_else
    converter = UnicodeFileToHtmTextConverter.new(nil)
    html = converter.convert_to_html("test content")
    assert_equal "test content<br />", html
  end

  def test_empty_file
    converter = UnicodeFileToHtmTextConverter.new('./empty.txt')
    html = converter.convert_to_html
    assert_equal "", html
  end

  def test_file_that_not_exists
    converter = UnicodeFileToHtmTextConverter.new('./none.txt') 
    assert_raises(Errno::ENOENT){
      html = converter.convert_to_html
    }

  end

  def test_escapes_an_entity
    converter = UnicodeFileToHtmTextConverter.new(nil)
    html = converter.convert_to_html('"test" è bello')
    assert_equal '&quot;test&quot; è bello<br />', html
  end

end