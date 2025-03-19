import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      _showErrorMessage(context, "เข้าสู่ระบบล้มเหลว: ${e.toString()}");
      return null;
    }
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      _showMessage(context, "อีเมลสำหรับรีเซ็ตรหัสผ่านถูกส่งแล้ว!");
    } catch (e) {
      _showErrorMessage(context, "เกิดข้อผิดพลาด: ${e.toString()}");
    }
  }

  Future<User?> createUserWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _showMessage(context, "สมัครสมาชิกสำเร็จ! กรุณาเข้าสู่ระบบ");
      return userCredential.user;
    } catch (e) {
      _showErrorMessage(context, "สมัครสมาชิกไม่สำเร็จ: ${e.toString()}");
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    _showMessage(context, "ออกจากระบบเรียบร้อย");
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
  }
}
