import 'package:flutter/material.dart';
import 'package:moneyappbaru/data/repository/category_repository.dart';
import 'package:moneyappbaru/data/repository/transaction_repository.dart';
import 'package:moneyappbaru/data/service/http_service.dart';
import 'package:moneyappbaru/data/use_case/response/get_transaction_response.dart';
import 'package:moneyappbaru/data/use_case/response/get_all_category_response.dart';

class Homapage extends StatefulWidget {
  const Homapage({super.key});

  @override
  State<Homapage> createState() => _HomapageState();
}

class _HomapageState extends State<Homapage> {
  getAllCategoryResponse? listCategory;
  final categoryRepo = CategoryRepository(HttpService());

  GetAllTransactionResponse? listTransaction;
  final transactionRepo = TransactionRepository(HttpService());

  @override
  void initState() {
    super.initState();
    loadCategory();
    loadTransaction();
  }

  Future<void> loadCategory() async {
    final response = await categoryRepo.getAllCategory();
    setState(() {
      listCategory = response;
    });
  }

  Future<void> loadTransaction() async {
    final response = await transactionRepo.getAllTransaction();
    setState(() {
      listTransaction = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Daftar Kategori"),
            Expanded(
              child: ListView.builder(
                itemCount: listCategory?.data.length ?? 0,
                itemBuilder: (context, index) {
                  return Text(listCategory!.data[index].name);
                },
              ),
            ),
            Text("Daftar Transaction"),
            Expanded(
              child: ListView.builder(
                itemCount: listTransaction?.data.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      listTransaction!.data[index].amount.toString(),
                    ),
                    title: Text(
                      listTransaction!.data[index].categoryName.toString(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
