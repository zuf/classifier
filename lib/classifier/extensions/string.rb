# encoding: utf-8

# Author::    Lucas Carlson  (mailto:lucas@rufy.com)
# Copyright:: Copyright (c) 2005 Lucas Carlson
# License::   LGPL
require 'lingua/stemmer'
require 'classifier/extensions/word_hash'

class Object
	def prepare_category_name; to_s.gsub("_"," ").capitalize.intern end
end

class String
  def stem
    #raise "Please send text to external stemmer before classification"
    lang = :en
    lang = :ru if self.scan(/[а-яА-ЯёЁ]+/).size > 2  # very naive language detection
    Lingua.stemmer self, lang: lang
  end
end
