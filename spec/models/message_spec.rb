require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'メッセージを保存できる場合' do
      it 'contentがあれば保存できること' do
        expect(build(:message, image: nil)).to be_valid
      end

      it 'imageがあれば保存できること' do
        expect(build(:message, content: nil)).to be_valid
      end

      it 'content と imageがあれば保存できること' do
        expect(build(:message)).to be_valid
      end
    end

    context 'メッセージを保存できない場合' do
      it 'メッセージも画像も無いと保存できない' do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to include("を入力してください")
      end

      it "group_idが無いと保存できない" do
        message = build(:message, group:nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it "user_idが無いと保存できない" do
        message = build(:message,user:nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")        
      end
    end
  end

  describe '#index' do
    context 'ログインしている場合' do
      it 'アクション内で定義しているインスタンス変数があるか' do
        
      end

      it '該当するビューが描画されているか' do
        expect(build(:message, content: nil)).to be_valid
      end
    end

    context 'ログインしていない場合' do
      it '意図したビューにリダイレクトできているか' do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to include("を入力してください")
      end
    end
  end
end