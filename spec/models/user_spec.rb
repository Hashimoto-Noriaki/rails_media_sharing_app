RSpec.describe User, type: :model do
  context '必要な情報が揃う' do
    let(:user) { build(:user) }

    it 'ユーザー登録が成功する' do
      expect(user).to be_valid
    end
  end

  context '名前だけが入力' do
    let(:user) { build(:user, email: nil, password: nil) }

    it 'エラーが発生する' do
      expect(user).not_to be_valid
    end
  end

  context 'メールアドレスが入力されていないとき' do
    let(:user) { build(:user, email: nil) }

    it 'エラーが発生すること' do
      expect(user).not_to be_valid
    end
  end

  context 'パスワードが入力されていない' do
    let(:user) { build(:user, password: nil) }

    it 'エラーが発生すること' do
      expect(user).not_to be_valid
    end
  end

  context 'パスワードの確認が一致しないとき' do
    let(:user) { build(:user, password: 'password', password_confirmation: 'different_password') }

    it 'エラーが発生すること' do
      expect(user).not_to be_valid
    end
  end

  context '名前が255文字を超えるとき' do
    let(:user) { build(:user, name: 'a' * 256) }

    it 'エラーが発生すること' do
      expect(user).not_to be_valid
    end

    it 'エラーメッセージが正しいこと' do
      expect(user.errors.full_messages).to include('Nameは255文字以内で入力してください')
    end
  end

  context '重複したメールアドレスがあるとき' do
    before do
      create(:user, email: 'unique@example.com')
    end

    let(:user) { build(:user, email: 'unique@example.com') }

    it 'エラーが発生すること' do
      expect(user).not_to be_valid
    end
  end

  context 'メールアドレスの形式が不正なとき' do
    let(:user) { build(:user, email: 'invalid-email') }

    it 'エラーが発生すること' do
      expect(user).not_to be_valid
    end
  end

  context 'パスワードが8文字未満のとき' do
    let(:user) { build(:user, password: 'a' * 7) }

    it 'エラーが発生すること' do
      expect(user).not_to be_valid
    end
  end
end
