import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/product/product_cubit.dart';
import 'package:flutter_nusacodes_2/blocs/sales_invoice/sales_invoice_cubit.dart';
import 'package:flutter_nusacodes_2/pages/home/invoice_tab.dart';
import 'package:flutter_nusacodes_2/pages/home/pos_tab.dart';
import 'package:flutter_nusacodes_2/pages/home/profile_tab.dart';

import '../../helpers/injector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var currentIndex = 0;
  
  final productCubit = ProductCubit(getIt.get());
  final salesInvoiceCubit = SalesInvoiceCubit(getIt.get());

  @override
  void initState() {
    productCubit.loadData();
    salesInvoiceCubit.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => productCubit
        ),
        BlocProvider(
          create: (context) => salesInvoiceCubit
        ),
      ],
      child: Scaffold(
        body: [
          const PosTab(),
          const InvoiceTab(),
          const ProfileTab(),
        ][currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'POS'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Invoice'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
            ),
          ],
        ),
      ),
    );
  }
}