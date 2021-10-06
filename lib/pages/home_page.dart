import 'package:flutter/material.dart';
import 'package:loginapp2/models/user_model.dart';
import 'package:loginapp2/services/pref_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void _doLogin(){
    String name = nameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user =User.from(name: name, email: email, password: password);
    Prefs.storeUser(user);

    Prefs.loadUser().then((user) => {
       print(user.name)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //#arrow button
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_outlined, color: Colors.black,)),
              ),
              const SizedBox(height: 30,),
              // Let's Get Started
             const Text("Let's Get Started!", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              const Text("Create an account to Q Allure to get all features", style: TextStyle(color: Colors.grey, fontSize: 20),),

            const SizedBox(height: 25,),
              // # name
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.blue
                  )
                ),
                child:  TextField(
                 controller: nameController,
                  decoration: const  InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.blue),
                    icon: Icon(Icons.person, color: Colors.blue,)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //#Email
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: Colors.blue
                    )
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.blue),
                      icon: Icon(Icons.email_outlined, color: Colors.blue,)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //#phoone
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: Colors.blue
                    )
                ),
                child:  TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.blue),
                      icon: Icon(Icons.phone_iphone_outlined, color: Colors.blue,)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //#password
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: Colors.blue
                    )
                ),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.blue),
                      icon: Icon(Icons.lock_open, color: Colors.blue,)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //#Confirm password
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.blue
                  )
                ),
                child: TextField(
                  controller: confirmController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Confirm password",
                      hintStyle: TextStyle(color: Colors.blue),
                      icon: Icon(Icons.lock_open, color: Colors.blue,)
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              //#create button
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue,
                ),
                child:  FlatButton(
                  onPressed: _doLogin,
                  child: const Text("Create", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),

                ),
              ),
              const SizedBox(height: 40,),
              //#Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("Already have an account?", style: TextStyle(color: Colors.black45, fontSize: 17),)
                  ),
                 const  SizedBox(width: 5,),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("Login Here", style: TextStyle(color: Colors.blue, fontSize: 19),)
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
