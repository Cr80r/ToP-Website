abstract class AiService { Future<String> reply(String prompt); }
class MockAiService implements AiService { @override Future<String> reply(String prompt) async => 'Mock guidance: start with verified Zaylo data, compare options, and avoid sharing sensitive personal or financial details.'; }
