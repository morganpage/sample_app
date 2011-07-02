class Highscore < ActiveRecord::Base
  attr_accessor   :encrypted_hash
  attr_accessible :name, :score , :encrypted_hash
  
  validates :name,  :presence => true,
                   :length => {:maximum =>50}
                    
  validates :encrypted_hash,  :presence =>true               

  validate :encrypted_hash_must_be_correct
  
  def encrypted_hash_must_be_correct
    secretKey = "Twas brillig, and the slithy toves. Did gyre and gimble in the wabe"
    inputString = self.name + self.score.to_s + secretKey
    ehash = Digest::MD5.hexdigest(inputString)
    if self.encrypted_hash != ehash
      errors.add(:encrypted_hash,"Encryped hash incorrect")
    end
  end                     
                    
end

# == Schema Information
#
# Table name: highscores
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  score      :integer
#  created_at :datetime
#  updated_at :datetime
#

