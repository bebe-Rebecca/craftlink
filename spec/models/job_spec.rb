require 'rails_helper'

RSpec.describe Job, type: :model do
  before do
    @job = FactoryBot.build(:job)
  end

  describe '投稿' do
    context '投稿できる場合' do
      it '全項目の値が存在すれば投稿できる' do
        expect(@job).to be_valid
      end
    end
    context '投稿できない場合' do
      it '画像が添付されていないと投稿できない' do
        @job.image = nil
        @job.valid?
        expect(@job.errors.full_messages).to include("Image can't be blank")
      end
      it '職種名がないと投稿できない' do
        @job.job_title = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Job title can't be blank")
      end
      it '店名 / 工房名がないと投稿できない' do
        @job.workshop_name = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Workshop name can't be blank")
      end
      it '店名 / 工房の所在地が選択されている場合は出品できない' do
        @job.origin_to_prefecture_id = 1
        @job.valid?
        expect(@job.errors.full_messages).to include("Origin to prefecture can't be blank")
      end
      it '仕事内容の説明がないと投稿できない' do
        @job.description = ''
        @job.valid?
        expect(@job.errors.full_messages).to include("Description can't be blank")
      end
      it 'userが紐づいていないと投稿できない' do
        @job.user = nil
        @job.valid?
        expect(@job.errors.full_messages).to include('User must exist')
      end
    end
  end
end