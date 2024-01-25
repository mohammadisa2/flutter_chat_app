class Endpoints {
  /// Current Api Version
  static const _apiVersion =
      "https://6716-2a09-bac1-34c0-18-00-278-a1.ngrok-free.app/api";

  /// Auth
  static const _baseAuth = "$_apiVersion/auth";

  static const register = "$_baseAuth/register";
  static const login = "$_baseAuth/login";
  static const loginWithToken = "$_baseAuth/login_with_token";
  static const logout = "$_baseAuth/logout";

  /// Chat
  static const _baseChat = "$_apiVersion/chat";

  static const getChats = _baseChat;
  static const getSingleChat = "$_baseChat/";
  static const createChat = _baseChat;

  /// Chat message
  static const _baseChatMessage = "$_apiVersion/chat_message";

  static const getChatMessages = _baseChatMessage;
  static const createChatMessage = _baseChatMessage;

  /// User

  static const getUsers = "$_apiVersion/user";
}
