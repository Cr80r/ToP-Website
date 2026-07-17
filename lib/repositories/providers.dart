import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mock_data_repository.dart';
import '../models/zaylo_models.dart';

final mockRepositoryProvider = Provider((ref) => MockDataRepository());
final onboardingCompleteProvider = StateProvider<bool>((ref) => false);
final authProvider = StateNotifierProvider<AuthController, bool>((ref) => AuthController());
class AuthController extends StateNotifier<bool> { AuthController():super(false); void signIn()=>state=true; void signOut()=>state=false; }
final expensesProvider = StateNotifierProvider<ExpensesController, List<ExpenseTransaction>>((ref)=>ExpensesController(ref.read(mockRepositoryProvider).expenses()));
class ExpensesController extends StateNotifier<List<ExpenseTransaction>> { ExpensesController(super.state); void add(ExpenseTransaction item)=>state=[item,...state]; }
