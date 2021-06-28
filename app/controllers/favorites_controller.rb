class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new #Favoriteクラスのインスタンス作成
    favorite.user_id = current_user.id #current_userのidを変数に代入
    favorite.topic_id= params[:topic_id]
    
    if favorite.save #favoriteが保存できているかどうかで条件分岐
      redirect_to topics_path, success: 'お気に入りに登録しました'
      
    else
      redirect_to topics_path, danger: 'お気に入りの登録に失敗しました'
      
   
  end
end