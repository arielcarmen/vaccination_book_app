import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class VaccinationCard extends StatelessWidget {
  final Map<String, dynamic> vaccination;

  const VaccinationCard({super.key, required this.vaccination});

  @override
  Widget build(BuildContext context) {
    final Timestamp timestamp = vaccination['date_expiration'];
    final DateTime expirationDate = timestamp.toDate();
    final formattedExpiration = DateFormat('dd MMM yyyy').format(expirationDate);

    final Timestamp vaccinationTimestamp = vaccination['date'];
    final DateTime date = vaccinationTimestamp.toDate();
    final formattedVaccinationDate = DateFormat('dd MMM yyyy').format(date);

    DateTime today = DateTime.now();
    DateTime vaccinationDateOnly = dateOnly(expirationDate);
    DateTime todayOnly = dateOnly(today);


    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal:24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [Colors.blue.shade50, Colors.white],
          // ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "id: ${vaccination['id']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    formattedVaccinationDate,
                    // DateFormat('dd MMM yyyy').format(DateTime.parse(vaccination['date'])).toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vaccin : ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                  Text(
                    vaccination['vaccin'].toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Statut: ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        vaccinationDateOnly.isAfter(todayOnly) ? "Valide" : "Expiré",
                        style: TextStyle(
                          color: vaccinationDateOnly.isAfter(todayOnly) ? Colors.green : Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Expiration:",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        formattedExpiration,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

DateTime dateOnly(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}