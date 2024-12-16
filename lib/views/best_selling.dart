import 'package:ecommerce_admin_app/controllers/db_service.dart';
import 'package:ecommerce_admin_app/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pie_chart/pie_chart.dart';

class BestSelling extends StatefulWidget {
  const BestSelling({super.key});

  @override
  State<BestSelling> createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
  final DbService dbService = DbService();
  late Stream<QuerySnapshot> ordersStream;

  @override
  void initState() {
    super.initState();
    ordersStream = dbService.readOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best Selling Products'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ordersStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No orders available.'));
          }

          // Extract orders from snapshot
          List<OrdersModel> orders = OrdersModel.fromJsonList(snapshot.data!.docs);

          // Count product occurrences
          Map<String, int> productCount = {};

          for (var order in orders) {
            for (var product in order.products) {
              if (productCount.containsKey(product.name)) {
                productCount[product.name] = productCount[product.name]! + 1;
              } else {
                productCount[product.name] = 1;
              }
            }
          }

          // Sort the products by count and take the top 5
          var sortedProducts = productCount.entries.toList()
            ..sort((a, b) => b.value.compareTo(a.value)); // Sort by count descending
          sortedProducts = sortedProducts.take(5).toList(); // Get top 5

          // Prepare data for the pie chart (only top 5)
          Map<String, double> pieChartData = {
            for (var entry in sortedProducts)
              entry.key: entry.value.toDouble(),
          };

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300, // Pie chart height
                  child: PieChart(
                    dataMap: pieChartData,
                    colorList: Colors.primaries, // Colors for the chart
                    chartRadius: MediaQuery.of(context).size.width / 2, // Radius of the pie chart
                    chartType: ChartType.disc, // Type of chart, you can also use ChartType.ring
                    ringStrokeWidth: 32, // Stroke width for the ring chart
                    animationDuration: Duration(milliseconds: 800),
                  
                    legendOptions: LegendOptions(
                      showLegends: true,
                      legendPosition: LegendPosition.bottom, // Place legend under the pie chart
                    ),
                    chartValuesOptions: ChartValuesOptions(showChartValues: true),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
