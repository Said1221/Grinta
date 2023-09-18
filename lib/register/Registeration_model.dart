class RegisterModel{

   String name;
   String email;
   String gov;
   String phone;
   String phName;
   String phAdd;
   String Uid;

  RegisterModel({
     this.name,
     this.email,
     this.gov,
     this.phone,
     this.phName,
     this.phAdd,
     this.Uid,
});

  RegisterModel.fromJson(Map<String , dynamic> json){
    name = json['name'];
    email = json['email'];
    gov = json['gov'];
    phone = json['phone'];
    phName = json['phName'];
    phAdd = json['phAdd'];
    Uid = json['Uid'];
  }

  Map<String , dynamic>toMap(){
    return{
      'name' : name,
      'email' : email,
      'gov' : gov,
      'phone' : phone,
      'phName' : phName,
      'phAdd' : phAdd,
      'Uid' : Uid,
    };
  }

}