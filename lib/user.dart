class User {
   final int coins;
   final int id;
   final String login;
   static late final User user;
   User(this.coins, this.id, this.login){
      user = this;
   }
   factory User.getUser(){
      return user;
   }
}