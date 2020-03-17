const cookieParser = require('cookie-parser')
const cors = require('cors')
const express = require('express')
const fallback = require('express-history-api-fallback')
const path = require('path')

module.exports = app => {
  const PORT = process.env.PORT || 8080

  app.set('PG_HOST', process.env.PG_HOST || 'localhost')
  app.set('PG_USER', process.env.PG_USER || 'postgres')
  app.set('PG_PASSWORD', process.env.PG_PASSWORD || '0615')
  app.set('PG_DB', process.env.PG_DB || 'boomtown')
  app.set('JWT_SECRET', '0615')
  app.set('JWT_COOKIE_NAME', 'LoginCookie')

  app.use(cookieParser())

  if (process.env.NODE_ENV === 'production') {
    const root = path.resolve(__dirname, '../public')

    // Serve the static front-end from /public when deployed
    app.use(express.static(root))
    app.use(fallback('index.html', { root }))
  }

  // Allow requests from dev server address
  const corsConfig = {
    origin: 'https://jun-boomtown.netlify.com',
    credentials: true
  }
  app.set('CORS_CONFIG', corsConfig)

  // Allow requests from dev server address
  app.use(cors(corsConfig))
  console.log('node env: ', process.env.NODE_ENV)
  return PORT
}
