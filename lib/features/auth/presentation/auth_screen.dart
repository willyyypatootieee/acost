import 'package:flutter/material.dart';

const primaryColor = Color(0xFF1EADEF);

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tab;

  @override
  void initState() {
    _tab = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _Header(tab: _tab),

          Expanded(
            child: TabBarView(
              controller: _tab,
              children: const [LoginForm(), RegisterForm()],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final TabController tab;

  const _Header({required this.tab});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),

          const Icon(Icons.home_work_rounded, color: Colors.white, size: 50),

          const SizedBox(height: 8),

          const Text(
            "acost",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          TabBar(
            controller: tab,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            tabs: const [
              Tab(text: "Masuk"),
              Tab(text: "Daftar"),
            ],
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return _FormCard(
      title: "Masuk",
      subtitle: "Masuk untuk melanjutkan layanan AC Anda",
      child: Column(
        children: [
          _PhoneField(),

          const SizedBox(height: 14),

          _PasswordField(),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text("Lupa Kata Sandi?"),
            ),
          ),

          const SizedBox(height: 10),

          _PrimaryButton(text: "Masuk", onPressed: () {}),

          const SizedBox(height: 16),

          Row(
            children: const [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text("atau"),
              ),
              Expanded(child: Divider()),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Belum punya akun? "),
              GestureDetector(
                onTap: () {
                  DefaultTabController.of(context).animateTo(1);
                },
                child: const Text(
                  "Daftar Sekarang",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return _FormCard(
      title: "Daftar",
      subtitle: "Buat akun baru untuk menggunakan layanan kami",
      child: Column(
        children: [
          _TextField("Nama Lengkap"),

          const SizedBox(height: 12),

          _PhoneField(),

          const SizedBox(height: 12),

          _TextField("Email"),

          const SizedBox(height: 12),

          _PasswordField(label: "Kata Sandi"),

          const SizedBox(height: 12),

          _PasswordField(label: "Konfirmasi Kata Sandi"),

          const SizedBox(height: 12),

          Row(
            children: const [
              Checkbox(value: true, onChanged: null),
              Expanded(
                child: Text(
                  "Saya setuju dengan Syarat dan Ketentuan serta Kebijakan Privasi",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _PrimaryButton(text: "Daftar", onPressed: () {}),
        ],
      ),
    );
  }
}

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// HEADER
          Container(
            height: 220,
            color: primaryColor,
            alignment: Alignment.center,
            child: const Text(
              "Verifikasi OTP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: _FormCard(
              title: "Verifikasi OTP",
              subtitle: "Masukkan kode OTP yang telah dikirim",
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      6,
                      (_) => SizedBox(
                        width: 45,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: const InputDecoration(counterText: ""),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    "Kirim ulang kode dalam 0:58",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 18),

                  _PrimaryButton(text: "Verifikasi", onPressed: () {}),

                  const SizedBox(height: 18),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Kode OTP berlaku selama 5 menit. "
                      "Jangan bagikan kode ini kepada siapa pun.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _FormCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(blurRadius: 14, color: Colors.black.withOpacity(0.08)),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(subtitle, style: const TextStyle(color: Colors.grey)),

              const SizedBox(height: 18),

              child,
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// FIELDS
////////////////////////////////////////////////////////////

class _TextField extends StatelessWidget {
  final String label;

  const _TextField(this.label);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text("+62"),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Nomor Telepon",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PasswordField extends StatelessWidget {
  final String label;

  const _PasswordField({this.label = "Kata Sandi"});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.visibility_off),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// BUTTON
////////////////////////////////////////////////////////////

class _PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _PrimaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
