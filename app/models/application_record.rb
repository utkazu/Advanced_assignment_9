class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.exact_match(column, value)
    self.where("#{column} = ?", value)
  end

  def self.prefix_match(column, value)
    self.where("#{column} LIKE ?", "#{value}%")
  end

  def self.backward_match(column, value)
    self.where("#{column} LIKE ?", "%#{value}")
  end

  def self.broad_match(column, value)
    self.where("#{column} LIKE ?", "%#{value}%")
  end

  def self.search(method, column, value)
    case method
      when 1
        exact_match(column, value)
      when 2
        prefix_match(column, value)
      when 3
        backward_match(column, value)
      when 4
        broad_match(column, value)
    end
  end
end
