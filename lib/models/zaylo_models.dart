enum VerificationStatus { verified, unverified, reviewing }
enum ExpenseType { income, expense }

class ServiceItem { const ServiceItem(this.name, this.description, this.route, this.icon); final String name, description, route; final int icon; }
class ExpenseTransaction { const ExpenseTransaction({required this.title, required this.amount, required this.category, required this.type, required this.date}); final String title, category; final double amount; final ExpenseType type; final DateTime date; }
class GroceryPrice { const GroceryPrice({required this.product, required this.store, required this.city, required this.price, required this.updatedAt, required this.verified}); final String product, store, city; final double price; final DateTime updatedAt; final bool verified; }
class FuelPrice { const FuelPrice(this.station, this.city, this.petrol, this.diesel, this.updatedAt, this.verified); final String station, city; final double petrol, diesel; final DateTime updatedAt; final bool verified; }
class ExchangeRate { const ExchangeRate(this.code, this.officialRate, this.communityRate, this.updatedAt); final String code; final double officialRate, communityRate; final DateTime updatedAt; }
class JobListing { const JobListing(this.title, this.company, this.location, this.type, this.posted, this.closing); final String title, company, location, type; final DateTime posted, closing; }
class RentalListing { const RentalListing(this.title, this.city, this.type, this.price, this.contact, this.verified); final String title, city, type, contact; final double price; final bool verified; }
class CommunityPost { const CommunityPost(this.category, this.author, this.body, this.createdAt, this.status, this.likes, this.comments); final String category, author, body; final DateTime createdAt; final VerificationStatus status; final int likes, comments; }
class OutageReport { const OutageReport(this.kind, this.area, this.city, this.createdAt, this.status, this.confirmations); final String kind, area, city; final DateTime createdAt; final VerificationStatus status; final int confirmations; }
class ResourceItem { const ResourceItem(this.title, this.category, this.description); final String title, category, description; }
class BillReminder { const BillReminder(this.name, this.amount, this.dueDate, this.frequency, this.paid); final String name, frequency; final double amount; final DateTime dueDate; final bool paid; }
