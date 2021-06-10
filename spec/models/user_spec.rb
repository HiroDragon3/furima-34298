require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  # 正常系
  context '新規登録できる時' do
    it '全ての項目が存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが存在すれば登録できる' do
      @user.nickname = 'aaa'
      expect(@user).to be_valid
    end

    it 'emailが存在すれば登録できる' do
      @user.email = 'sample@sample.com'
      expect(@user).to be_valid
    end

    it 'passwordが存在すれば登録できる' do
      @user.password = ''
    end

    it 'password:半角英数混合(半角英語のみ)が存在すると登録できる' do
      @user.password = '123aaa'
      @user.password_confirmation = '123aaa'
      expect(@user).to be_valid
    end

    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = '123aaa'
      @user.password_confirmation = '123aaa'
      expect(@user).to be_valid
    end

    it 'last_nameが存在すると登録できる' do
      @user.last_name = 'あ'
      expect(@user).to be_valid
    end

    it 'first_nameが存在すると登録できる' do
      @user.first_name = 'あ'
      expect(@user).to be_valid
    end

    it 'last_nameは全角（漢字・ひらがな・カタカナ）が存在すると登録できる' do
      @user.last_name = '山田'
      expect(@user).to be_valid
    end

    it 'first_nameは全角（漢字・ひらがな・カタカナ）が存在すると登録できる' do
      @user.first_name = '太朗'
      expect(@user).to be_valid
    end

    it 'last_nameは全角（カタカナ）が存在すると登録できる' do
      @user.last_name_kana = 'ヤマダ'
      expect(@user).to be_valid
    end

    it 'first_nameは全角（カタカナ）が存在すると登録できる' do
      @user.first_name_kana = 'タロウ'
      expect(@user).to be_valid
    end

    it 'birth_dateが存在すると登録できる' do
      @user.birth_date = '1930-01-01'
    end
  end

  # 異常系
  context '新規登録できない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
  
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  
    it 'emailは@が含まれていなければ登録できない' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
  
    it 'passwordが空では登録ができない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
  
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
  
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
  
    it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
  
    it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
  
    it 'last_nameは全角（カタカナ）でなければ登録できない' do
      @user.last_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
  
    it 'first_nameは全角（カタカナ）でなければ登録できない' do
      @user.first_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
  
    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
