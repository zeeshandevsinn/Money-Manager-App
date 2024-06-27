import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'What is Kamino Money Manager?',
      answer:
          'Kamino Money Manager is an app designed to help you manage your expenses, '
          'track balances, and analyze your spending habits effectively.',
    ),
    FAQItem(
      question: 'How can I track my expenses with Kamino?',
      answer:
          'You can track your expenses by adding transactions under different categories. '
          'Kamino provides detailed reports and analytics to help you understand where your money goes.',
    ),
    FAQItem(
      question: 'Can I manage multiple accounts?',
      answer:
          'Yes, Kamino allows you to manage multiple accounts or budgets simultaneously. '
          'You can set different limits and track expenses for each account.',
    ),
    FAQItem(
      question: 'Is my data secure?',
      answer:
          'Yes, Kamino prioritizes the security of your data. We use encryption and secure '
          'authentication methods to protect your financial information.',
    ),
    FAQItem(
      question: 'How do I contact support?',
      answer:
          'For any assistance or queries, please contact our support team at support@kaminoapp.com. '
          'We are available 24/7 to help you.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Frequently Asked Questions',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "KAMINO MONEY MANAGER FAQs",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: faqItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ExpansionTile(
                    title: Text(
                      faqItems[index].question,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          faqItems[index].answer,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
