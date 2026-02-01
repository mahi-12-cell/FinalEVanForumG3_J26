
import React from "react";
import { Navigate } from "react-router-dom";

const ProtectedRoute = ({ children }) => {
  const token = localStorage.getItem("token");

  // If user is not logged in, redirect to login
  if (!token) {
    return <Navigate to="/login" replace />;
  }
  return children;         // User is logged in, render the page
};

export default ProtectedRoute;
