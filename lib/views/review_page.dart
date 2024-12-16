import 'package:ecommerce_admin_app/controllers/db_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewPage extends StatelessWidget {
  final DbService dbService = DbService(); // Create an instance of DbService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Reviews"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: dbService.readReviews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error loading reviews"));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No reviews available"));
          }

          final reviews = snapshot.data!.docs;

          return ListView.builder(
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              // Extract data from the review document
              final reviewData = reviews[index].data() as Map<String, dynamic>;
              final orderDetails = reviewData['order_details'] as Map<String, dynamic>? ?? {};
              final userName = orderDetails['name'] ?? 'Unknown';
              final userEmail = orderDetails['email'] ?? 'Unknown';
              final orderId = reviewData['order_id'] ?? 'N/A';
              final total = orderDetails['total'] ?? 0.0;
              final reviewText = reviewData['review'] ?? 'No review';
              final rating = reviewData['rating'] ?? 'N/A';

              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username: $userName",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Email: $userEmail",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Order ID: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            orderId,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Total: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "${total.toStringAsFixed(2)}",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Rating: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "$rating / 5",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Review: $reviewText",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
