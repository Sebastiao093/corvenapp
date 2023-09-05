import 'package:corven_app/providers/login_provider.dart';
import 'package:corven_app/ui/input_decorations.dart';
import 'package:corven_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.person_pin, size: 35,),
            ),
          )
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
        icon: const Icon(Icons.menu, size: 35,),
        onPressed: () { Scaffold.of(context).openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
          }
        )
        
        
      ),
      drawer: SideMenu(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
                  width: double.infinity,
                  color: Color.fromRGBO(247, 143, 30, 5),
              child: Padding(
                padding: const EdgeInsets.only(left:40.0, right: 40, top:10, bottom: 10),
                child: Container(
                  
                  
                  color: Colors.white,
                  child: TextFormField(
                    
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecorations.authInputDecoration(
                      hintText: 'Buscá tu producto',
                      labelText: '',
                      prefixIcon: Icons.search
                    ),
                    validator: ( value ){
                      
      
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              color: Color.fromRGBO(247, 143, 30, 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('600 - Resultados'),
                  Row(
                    children: [
                      Text('Stock'),
                      SizedBox(width: 10,),
                      Container(
                        height: 40,
                        width: 40,
                        child: Switch(
                          activeColor: Colors.green,
                          value: loginForm.isSwitchActive, 
                          onChanged: (value){
                            loginForm.isSwitchActive = value;
                            setState(() {
                            });
                      
                        }),
                      ),
                    ],
                  ),
                  /* SwitchListTile.adaptive(
                    value: true,
                    title: Text('Stock'), 
                    onChanged: (value){}
                    ) */
                ],
              ),
            ),
            Expanded(child: ProductList(),
            ),
            
            Container(
              height: 50,
              width: double.infinity,
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.app_registration))
                ],
              ),
              
            ),
          ],
        ),
      )
    );
  }
}

