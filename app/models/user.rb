class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  # nickname, family_name, first_nameはどの文字・数字・アルファベットも入力可能なため正規表現は設定しない
  # 生年月日はプルダウンメニューから選択のため正規表現は設定しない
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname,         presence: true
  validates :password,         presence: true
  validates :family_name,      presence: true
  validates :first_name,       presence: true
  validates :family_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/} # 名前カナはカタカナ・ひらがな両方入力できる
  validates :first_name_kana,  presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/}
  validates :birth_year,       presence: true
  validates :birth_month,      presence: true
  validates :birth_day,        presence: true

  # アソシエーション
  has_one :telephone
  has_one :address
  has_one :card
  has_many :items

  # enum
  enum birth_year: {"1990":1990,"1991":1991,"1992":1992,"1993":1993,"1994":1994,"1995":1995,"1996":1996,"1997":1997,"1998":1998,"1999":1999,"2000":2000,"2001":2001}
  enum birth_month: {"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"10":10,"11":11,"12":12}, _prefix: true # 「_prefix: true」は、同じ値がある場合記述
  enum birth_day: {"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"10":10,"11":11,"12":12,"13":13,"14":14,"15":15,"16":16,"17":17,"18":18,"19":19,"20":20,"21":21,"22":22,"23":23,"24":24,"25":25,"26":26,"27":27,"28":28,"29":29,"30":30,"31":31}, _prefix: true
end
