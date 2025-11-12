import 'package:flutter/material.dart';

void main() {
  runApp(const BitMateApp());
}

class BitMateApp extends StatelessWidget {
  const BitMateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set this to true to show HomePage, false to show LoginScreen
    final bool isAuthenticated = false;

    return MaterialApp(
      title: 'BitLogger',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF10B981),
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF10B981),
          secondary: Color(0xFF14B8A6),
        ),
      ),
      home: isAuthenticated ? const HomePage() : const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _logkeyController = TextEditingController();
  bool _obscureLogkey = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BinaryBackground(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF10B981).withOpacity(0.5),
                            blurRadius: 30,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text('🔐', style: TextStyle(fontSize: 60)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'BitLog',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shield, size: 16, color: const Color(0xFF10B981)),
                        const SizedBox(width: 6),
                        const Text(
                          'End-to-end encrypted messaging',
                          style: TextStyle(color: Color(0xFF10B981), fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    TextField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                        prefixIcon: Icon(Icons.email, color: const Color(0xFF10B981)),
                        filled: true,
                        fillColor: const Color(0xFF1F2937).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: const Color(0xFF10B981).withOpacity(0.3),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: const Color(0xFF10B981).withOpacity(0.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF10B981),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _logkeyController,
                      obscureText: _obscureLogkey,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'LogKey',
                        labelStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                        prefixIcon: Icon(Icons.vpn_key, color: const Color(0xFF10B981)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureLogkey ? Icons.visibility_off : Icons.visibility,
                            color: const Color(0xFF10B981),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureLogkey = !_obscureLogkey;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: const Color(0xFF1F2937).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: const Color(0xFF10B981).withOpacity(0.3),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: const Color(0xFF10B981).withOpacity(0.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF10B981),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Add authentication logic here
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF10B981),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                          shadowColor: const Color(0xFF10B981).withOpacity(0.5),
                        ),
                        child: const Text(
                          'Secure Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot LogKey?',
                        style: TextStyle(color: Color(0xFF10B981)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account? ',
                          style: TextStyle(color: Color(0xFF9CA3AF)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xFF10B981),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ChatListPage(),
    const ActiveListPage(),
    const AIBotsPage(),
  ];
  var userData = {
    "name":"Rahat_almas",
    "avatar":"https://i.pinimg.com/736x/6e/8c/05/6e8c05e06c647f5352591cdb6c7283ae.jpg"
  };
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BitLog',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.lock,
              size: 16,
              color: const Color(0xFF10B981),
            ),
          ],
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: const Color(0xFF10B981)),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ClipOval(
              child: userData.containsKey("avatar") && userData["avatar"]!.isNotEmpty
                  ? Image.network(
                userData["avatar"]!,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey[800],
                    child: const Icon(
                      Icons.person,
                      size: 24,
                      color: Colors.white70,
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey[800],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                            : null,
                        strokeWidth: 2,
                        color: Color(0xFF10B981),
                      ),
                    ),
                  );
                },
              )
                  : Container(
                width: 40,
                height: 40,
                color: Colors.grey[800],
                child: const Icon(
                  Icons.person,
                  size: 24,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          const BinaryBackground(),
          _pages[_currentIndex],
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: const Color(0xFF10B981).withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: const Color(0xFF0A0A0A),
          selectedItemColor: const Color(0xFF10B981),
          unselectedItemColor: const Color(0xFF4B5563),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Active',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy),
              label: 'AI Bots',
            ),
          ],
        ),
      ),
    );
  }
}


// Data Models
class ChatItem {
  final String avatar;
  final String name;
  final String lastMessage;
  final String time;
  final int unread;
  final bool online;

  ChatItem(
      this.avatar,
      this.name,
      this.lastMessage,
      this.time,
      this.unread,
      this.online,
      );
}

class ActiveUser {
  final String avatar;
  final String name;
  final String status;
  final String mood;

  ActiveUser(this.avatar, this.name, this.status, this.mood);
}

class AIBot {
  final String avatar;
  final String name;
  final String description;
  final String specialty;

  AIBot(this.avatar, this.name, this.description, this.specialty);
}

class Message {
  final String text;
  final bool isSent;
  final String time;

  Message(this.text, this.isSent, this.time);
}

class BinaryBackground extends StatelessWidget {
  const BinaryBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.05,
        child: CustomPaint(
          painter: BinaryPainter(),
        ),
      ),
    );
  }
}

class BinaryPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: const TextSpan(
        text: '01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010\n',
        style: TextStyle(
          color: Color(0xFF10B981),
          fontSize: 10,
          fontFamily: 'monospace',
        ),
      ),
    );
    textPainter.layout();

    for (double y = 0; y < size.height; y += 15) {
      textPainter.paint(canvas, Offset(0, y));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0A0A0A),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF10B981).withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF10B981).withOpacity(0.5),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text('🔐', style: TextStyle(fontSize: 35)),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Secure User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  '@bitmaster',
                  style: TextStyle(color: Color(0xFF10B981), fontSize: 13),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shield, size: 11, color: const Color(0xFF10B981)),
                    const SizedBox(width: 4),
                    const Text(
                      'End-to-end encrypted',
                      style: TextStyle(color: Color(0xFF10B981), fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(Icons.person, 'Profile', context),
                _buildDrawerItem(Icons.lock, 'Privacy & Security', context),
                _buildDrawerItem(Icons.palette, 'Themes', context),
                _buildDrawerItem(Icons.notifications, 'Notifications', context),
                _buildDrawerItem(Icons.chat, 'Chat Settings', context),
                _buildDrawerItem(Icons.info, 'About', context),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Divider(color: Color(0xFF10B981), thickness: 0.5),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF10B981),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.logout, size: 20),
                  SizedBox(width: 8),
                  Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF10B981)),
      title: Text(
        title,
        style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ProfilePage();
        }));
      },
      hoverColor: const Color(0xFF10B981).withOpacity(0.1),
    );
  }g
}

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chats = [
      ChatItem('https://i.pinimg.com/1200x/61/a7/11/61a711da6530d1881d99079bb1ca7d07.jpg', 'Luna Moon', 'See you tomorrow! 🌙', '2m ago', 2, true),
      ChatItem('https://i.pinimg.com/736x/30/f8/56/30f85663a6807ca681cfe3bcbd841b66.jpg', 'Star Dreamer', 'That sounds amazing!', '15m ago', 0, true),
      ChatItem('https://i.pinimg.com/736x/1b/6a/c1/1b6ac1a458b9979625bc0e9701a42f8d.jpg', 'Rose Garden', 'Thanks for the help 💕', '1h ago', 1, false),
      ChatItem('https://i.pinimg.com/736x/90/b2/fc/90b2fc026e89bee7ceb41363027e47ee.jpg', 'Sky Walker', 'Let me know when you\'re free', '3h ago', 0, true),
      ChatItem('https://i.pinimg.com/736x/7f/54/72/7f5472b9d1ed7f5435dbb8983f793131.jpg', 'Ocean Breeze', 'Perfect! Talk soon', '5h ago', 0, false),
      ChatItem('https://i.pinimg.com/736x/17/99/5f/17995f7bf1a90d02e115882e2ed910bb.jpg', 'Honey Bee', 'Sweet dreams! 💫', '1d ago', 0, false),
      ChatItem('https://i.pinimg.com/736x/aa/f9/f3/aaf9f3cf02cffc57817226553a81b9bd.jpg', 'Cherry Blossom', 'Love that idea!', '2d ago', 0, true),
      ChatItem('https://i.pinimg.com/736x/80/e7/87/80e787ca4b39479e17b84320168cbeb5.jpg', 'Sunset Glow', 'Catch you later! ✨', '2d ago', 0, false),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search encrypted chats...',
              hintStyle: const TextStyle(color: Color(0xFF6B7280)),
              prefixIcon: Icon(Icons.search, color: const Color(0xFF10B981)),
              filled: true,
              fillColor: const Color(0xFF1F2937).withOpacity(0.5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: const Color(0xFF10B981).withOpacity(0.3),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: const Color(0xFF10B981).withOpacity(0.3),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(chat: chat, isAI: false),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color(0xFF1F2937).withOpacity(0.5),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF10B981).withOpacity(0.3),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: chat.avatar.startsWith('http')
                                  ? Image.network(
                                chat.avatar,
                                width: 56,
                                height: 56,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 56,
                                    height: 56,
                                    color: Colors.grey[800],
                                    child: const Icon(
                                      Icons.person,
                                      size: 32,
                                      color: Colors.white70,
                                    ),
                                  );
                                },
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Container(
                                    width: 56,
                                    height: 56,
                                    color: Colors.grey[800],
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                            : null,
                                        strokeWidth: 2,
                                        color: Color(0xFF10B981),
                                      ),
                                    ),
                                  );
                                },
                              )
                                  : Container(
                                width: 56,
                                height: 56,
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.person,
                                  size: 32,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                          if (chat.online)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF10B981),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    chat.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Icon(Icons.lock, size: 12, color: const Color(0xFF10B981)),
                                const SizedBox(width: 4),
                                Text(
                                  chat.time,
                                  style: const TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    chat.lastMessage,
                                    style: const TextStyle(
                                      color: Color(0xFF9CA3AF),
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (chat.unread > 0)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFF10B981).withOpacity(0.5),
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      '${chat.unread}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ActiveListPage extends StatelessWidget {
  const ActiveListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeUsers = [
      ActiveUser('https://i.pinimg.com/1200x/61/a7/11/61a711da6530d1881d99079bb1ca7d07.jpg', 'Sky Walker', 'Above the clouds', 'adventurous'),
      ActiveUser('https://i.pinimg.com/736x/30/f8/56/30f85663a6807ca681cfe3bcbd841b66.jpg', 'Rose Garden', 'Tending flowers', 'gentle'),
      ActiveUser('https://i.pinimg.com/736x/1b/6a/c1/1b6ac1a458b9979625bc0e9701a42f8d.jpg', 'Honey Bee', 'Buzzing around', 'busy'),
      ActiveUser('https://i.pinimg.com/736x/90/b2/fc/90b2fc026e89bee7ceb41363027e47ee.jpg', 'Star Dreamer', 'Watching the cosmos', 'wonder'),
      ActiveUser('https://i.pinimg.com/736x/7f/54/72/7f5472b9d1ed7f5435dbb8983f793131.jpg', 'Luna Moon', 'Dreaming under stars', 'peaceful'),
      ActiveUser('https://i.pinimg.com/736x/17/99/5f/17995f7bf1a90d02e115882e2ed910bb.jpg', 'Cherry Blossom', 'Dancing in wind', 'joyful'),
      ActiveUser('https://i.pinimg.com/736x/aa/f9/f3/aaf9f3cf02cffc57817226553a81b9bd.jpg', 'Totoro Friend', 'Napping in forest', 'cozy'),
      ActiveUser('https://i.pinimg.com/736x/80/e7/87/80e787ca4b39479e17b84320168cbeb5.jpg', 'Ponyo Wave', 'Swimming freely', 'playful'),

    ];

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: activeUsers.length,
      itemBuilder: (context, index) {
        final user = activeUsers[index];
        return InkWell(
          onTap: () {
            // Convert ActiveUser to ChatItem for navigation
            final chatItem = ChatItem(
              user.avatar,
              user.name,
              user.status,
              'Now',
              0,
              true,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(chat: chatItem, isAI: false),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1F2937).withOpacity(0.5),
                  const Color(0xFF10B981).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF10B981).withOpacity(0.1),
              ),
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFF10B981).withOpacity(0.3),width:2),
                        // gradient: const LinearGradient(
                        //   colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
                        // ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: const Color(0xFF10B981).withOpacity(0.3),
                        //     blurRadius: 10,
                        //   ),
                        // ],
                      ),
                      child: ClipOval(
                          child: user.avatar.startsWith('http')
                              ? Image.network(
                            user.avatar,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 56,
                                height: 56,
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.person,
                                  size: 32,
                                  color: Colors.white70,
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                width: 56,
                                height: 56,
                                color: Colors.grey[800],
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                        : null,
                                    strokeWidth: 2,
                                    color: Color(0xFF10B981),
                                  ),
                                ),
                              );
                            },
                          )
                              : Container(
                            width: 56,
                            height: 56,
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.person,
                              size: 32,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                    ),
                    Positioned(
                      bottom: -2,
                      right: -2,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: const Center(
                          child: SizedBox(
                            width: 8,
                            height: 8,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.status,
                        style: const TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: _getMoodColor(user.mood),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            user.mood,
                            style: const TextStyle(
                              color: Color(0xFF10B981),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.message, color: const Color(0xFF10B981)),
                  onPressed: () {
                    final chatItem = ChatItem(
                      user.avatar,
                      user.name,
                      user.status,
                      'Now',
                      0,
                      true,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(chat: chatItem, isAI: false),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getMoodColor(String mood) {
    switch (mood) {
      case 'peaceful':
        return Colors.blue;
      case 'wonder':
        return Colors.purple;
      case 'adventurous':
        return Colors.lightBlue;
      case 'gentle':
        return Colors.pink;
      case 'busy':
        return Colors.yellow;
      case 'joyful':
        return Colors.pinkAccent;
      case 'cozy':
        return Colors.amber;
      default:
        return Colors.teal;
    }
  }
}

class AIBotsPage extends StatelessWidget {
  const AIBotsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bots = [
      AIBot('🤖', 'BitBot Assistant', 'Your personal AI helper', 'Available 24/7'),
      AIBot('🧠', 'Knowledge Master', 'Answer any question', 'Expert in everything'),
      AIBot('💼', 'Career Advisor', 'Professional guidance', 'Career planning'),
      AIBot('🎨', 'Creative Muse', 'Spark your creativity', 'Art & Writing'),
      AIBot('💪', 'Fitness Coach', 'Health & wellness', 'Stay motivated'),
      AIBot('📚', 'Study Buddy', 'Learn anything faster', 'Educational support'),
      AIBot('🌟', 'Life Coach', 'Personal development', 'Goal achievement'),
      AIBot('🔧', 'Tech Support', 'Solve tech problems', 'IT assistance'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: bots.length,
      itemBuilder: (context, index) {
        final bot = bots[index];
        return InkWell(
          onTap: () {
            // Convert AIBot to ChatItem for navigation
            final chatItem = ChatItem(
              bot.avatar,
              bot.name,
              bot.description,
              'Now',
              0,
              true,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(chat: chatItem, isAI: true),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1F2937).withOpacity(0.5),
                  const Color(0xFF10B981).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF10B981).withOpacity(0.1),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF10B981).withOpacity(0.5),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(bot.avatar, style: const TextStyle(fontSize: 30)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bot.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        bot.description,
                        style: const TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF10B981).withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          bot.specialty,
                          style: const TextStyle(
                            color: Color(0xFF10B981),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF10B981).withOpacity(0.3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.chat_bubble, color: Colors.white),
                    onPressed: () {
                      final chatItem = ChatItem(
                        bot.avatar,
                        bot.name,
                        bot.description,
                        'Now',
                        0,
                        true,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(chat: chatItem, isAI: true),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        title: const Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color(0xFF10B981)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          const BinaryBackground(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF10B981).withOpacity(0.5),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text('🔐', style: TextStyle(fontSize: 60)),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Secure User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '@bitmaster',
                  style: TextStyle(color: Color(0xFF10B981), fontSize: 16),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shield, size: 16, color: const Color(0xFF10B981)),
                    const SizedBox(width: 6),
                    const Text(
                      'End-to-end encrypted',
                      style: TextStyle(color: Color(0xFF10B981), fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                _buildProfileItem(Icons.person, 'Edit Profile', context),
                _buildProfileItem(Icons.lock, 'Privacy & Security', context),
                _buildProfileItem(Icons.notifications, 'Notifications', context),
                _buildProfileItem(Icons.storage, 'Data & Storage', context),
                _buildProfileItem(Icons.palette, 'Appearance', context),
                _buildProfileItem(Icons.language, 'Language', context),
                _buildProfileItem(Icons.help, 'Help & Support', context),
                _buildProfileItem(Icons.info, 'About', context),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.logout),
                      SizedBox(width: 8),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF10B981).withOpacity(0.2),
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF10B981)),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            color: const Color(0xFF6B7280), size: 16),
        onTap: () {},
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final ChatItem chat;
  final bool isAI;

  const ChatPage({Key? key, required this.chat, required this.isAI}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  late List<Message> _messages;

  @override
  void initState() {
    super.initState();
    if (widget.isAI) {
      _messages = [
        Message('Hello! I\'m ${widget.chat.name}. How can I assist you today? 🤖', false, '10:30 AM'),
      ];
    } else {
      _messages = [
        Message('Hey! How are you doing?', false, '10:30 AM'),
        Message('I\'m doing great! Just finished a project 🎉', true, '10:32 AM'),
        Message('That\'s awesome! Tell me more about it', false, '10:33 AM'),
        Message('It was a chat app design, really proud of how it turned out', true, '10:35 AM'),
        Message('Would love to see it sometime!', false, '10:36 AM'),
      ];
    }
  }

  void _sendMessage() {
    if (_messageController.text.isEmpty) return;

    setState(() {
      _messages.add(
        Message(
          _messageController.text,
          true,
          'Now',
        ),
      );
    });

    final userMessage = _messageController.text;
    _messageController.clear();

    // AI auto-response
    if (widget.isAI) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted) {
          setState(() {
            _messages.add(
              Message(
                _generateAIResponse(userMessage),
                false,
                'Now',
              ),
            );
          });
        }
      });
    }
  }

  String _generateAIResponse(String userMessage) {
    final responses = [
      'That\'s a great question! Let me help you with that. 🤖',
      'I understand what you\'re asking. Here\'s what I think... 💭',
      'Interesting perspective! Based on my analysis... 📊',
      'I\'m here to help! Let me provide you with some insights. ✨',
      'Thanks for asking! I can definitely assist with that. 🎯',
    ];
    return responses[DateTime.now().millisecond % responses.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: widget.isAI
            ? const Color(0xFF0A0A0A)
            : const Color(0xFF0A0A0A),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color(0xFF10B981)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: widget.isAI
                          ? [const Color(0xFF8B5CF6), const Color(0xFF10B981)]
                          : [const Color(0xFF10B981), const Color(0xFF14B8A6)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: (widget.isAI ? const Color(0xFF8B5CF6) : const Color(0xFF10B981))
                            .withOpacity(0.5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: widget.chat.avatar.startsWith('http')
                        ? Image.network(
                      widget.chat.avatar,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 56,
                          height: 56,
                          color: Colors.grey[800],
                          child: const Icon(
                            Icons.person,
                            size: 32,
                            color: Colors.white70,
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 56,
                          height: 56,
                          color: Colors.grey[800],
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                              strokeWidth: 2,
                              color: Color(0xFF10B981),
                            ),
                          ),
                        );
                      },
                    )
                        : Container(
                      width: 56,
                      height: 56,
                      color: Colors.grey[800],
                      child: const Icon(
                        Icons.person,
                        size: 32,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                if (widget.chat.online && !widget.isAI)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                if (widget.isAI)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B5CF6),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          widget.chat.name,
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        widget.isAI ? Icons.smart_toy : Icons.lock,
                        size: 10,
                        color: widget.isAI ? const Color(0xFF8B5CF6) : const Color(0xFF10B981),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        widget.isAI ? Icons.psychology : Icons.shield,
                        size: 10,
                        color: widget.isAI ? const Color(0xFF8B5CF6) : const Color(0xFF10B981),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          widget.isAI
                              ? 'AI Assistant • Always Active'
                              : 'Encrypted • ${widget.chat.online ? "Online" : "Offline"}',
                          style: TextStyle(
                            color: widget.isAI ? const Color(0xFF8B5CF6) : const Color(0xFF10B981),
                            fontSize: 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          if (!widget.isAI) ...[
            IconButton(
              icon: Icon(Icons.call, color: const Color(0xFF10B981)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.videocam, color: const Color(0xFF10B981)),
              onPressed: () {},
            ),
          ],
          IconButton(
            icon: Icon(Icons.more_vert, color: const Color(0xFF10B981)),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          const BinaryBackground(),
          Column(
            children: [
              // if (widget.isAI)
              //   Container(
              //     padding: const EdgeInsets.all(12),
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [
              //           const Color(0xFF8B5CF6).withOpacity(0.2),
              //           const Color(0xFF10B981).withOpacity(0.1),
              //         ],
              //       ),
              //       border: Border(
              //         bottom: BorderSide(
              //           color: const Color(0xFF8B5CF6).withOpacity(0.3),
              //         ),
              //       ),
              //     ),
              //     child: Row(
              //       children: [
              //         //Icon(Icons.info_outline, size: 16, color: const Color(0xFF8B5CF6)),
              //         //const SizedBox(width: 8),
              //         // Expanded(
              //         //   child: Text(
              //         //     'AI-powered conversation • Responses may vary',
              //         //     style: TextStyle(
              //         //       color: const Color(0xFF8B5CF6).withOpacity(0.9),
              //         //       fontSize: 12,
              //         //     ),
              //         //   ),
              //         // ),
              //       ],
              //     ),
              //   ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return Align(
                      alignment: message.isSent ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        child: Column(
                          crossAxisAlignment:
                          message.isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                gradient: message.isSent
                                    ?
                                LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF10B981).withOpacity(0.2),
                                    Color(0xFF10B981).withOpacity(0.2),
                                  ],
                                )

                                    :
                                widget.isAI
                                    ?
                                  LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      const Color(0xFF1F2937).withOpacity(0.5),
                                      const Color(0xFF8B5CF6).withOpacity(0.1),
                                    ],
                                  )
                                    : null,

                                color: message.isSent
                                    ? null
                                    : widget.isAI
                                    ? null
                                    : const Color(0xFF1F2937).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16).copyWith(
                                  bottomRight:
                                  message.isSent ? const Radius.circular(4) : null,
                                  bottomLeft: message.isSent ? null : const Radius.circular(4),
                                ),
                                // border: Border.all(
                                //   color: widget.isAI && !message.isSent
                                //       ? const Color(0xFF8B5CF6).withOpacity(0.4)
                                //       : message.isSent
                                //       ? Colors.transparent
                                //       : const Color(0xFF10B981).withOpacity(0.1),
                                // ),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: message.isSent
                                //         ? const Color(0xFF10B981).withOpacity(0.2)
                                //         : widget.isAI
                                //         ? const Color(0xFF8B5CF6).withOpacity(0.2)
                                //         : Colors.black.withOpacity(0.5),
                                //     blurRadius: 8,
                                //   ),
                                // ],
                              ),
                              child: Text(
                                message.text,
                                style: TextStyle(
                                  color: message.isSent
                                      ? Colors.white
                                      : const Color(0xFFF3F4F6),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  widget.isAI && !message.isSent ? Icons.smart_toy : Icons.lock,
                                  size: 10,
                                  color: widget.isAI && !message.isSent
                                      ? const Color(0xFF8B5CF6)
                                      : const Color(0xFF10B981),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  message.time,
                                  style: const TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A0A0A).withOpacity(0.95),
                  border: Border(
                    top: BorderSide(
                      color: widget.isAI
                          ? const Color(0xFF8B5CF6).withOpacity(0.3)
                          : const Color(0xFF10B981).withOpacity(0.2),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    if (!widget.isAI)
                      IconButton(
                        icon: Icon(Icons.attach_file, color: const Color(0xFF10B981)),
                        onPressed: () {},
                      ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: widget.isAI
                              ? 'Ask me anything...'
                              : 'Type a secure message...',
                          hintStyle: const TextStyle(color: Color(0xFF6B7280)),
                          filled: true,
                          fillColor: const Color(0xFF1F2937).withOpacity(0.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(
                              color: widget.isAI
                                  ? const Color(0xFF8B5CF6).withOpacity(0.3)
                                  : const Color(0xFF10B981).withOpacity(0.3),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(
                              color: widget.isAI
                                  ? const Color(0xFF8B5CF6).withOpacity(0.3)
                                  : const Color(0xFF10B981).withOpacity(0.3),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(
                              color: widget.isAI
                                  ? const Color(0xFF8B5CF6).withOpacity(0.5)
                                  : const Color(0xFF10B981).withOpacity(0.5),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    if (!widget.isAI)
                      IconButton(
                        icon: Icon(Icons.emoji_emotions, color: const Color(0xFF10B981)),
                        onPressed: () {},
                      ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: widget.isAI
                              ? [const Color(0xFF8B5CF6), const Color(0xFF10B981)]
                              : [const Color(0xFF10B981), const Color(0xFF14B8A6)],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: (widget.isAI ? const Color(0xFF8B5CF6) : const Color(0xFF10B981))
                                .withOpacity(0.3),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white, size: 20),
                        onPressed: _sendMessage,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}