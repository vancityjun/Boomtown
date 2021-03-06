import { ApolloClient } from 'apollo-client'
import { ApolloLink } from 'apollo-link'
import { createHttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
import { onError } from 'apollo-link-error'

const httpLink = createHttpLink({
  includeExtensions: true,
  // uri:
  //   process.env.NODE_ENV !== 'production'
  //     ? 'http://localhost:8080/graphql'
  //     : 'https://jun-boomtown-server.herokuapp.com/graphql',
  // credentials: process.env.NODE_ENV === 'production' ? 'same-origin' : 'include'
  uri: 'https://jun-boomtown-server.herokuapp.com/graphql',
  credentials: 'include'
})

const client = new ApolloClient({
  link: ApolloLink.from([
    onError(({ graphQLErrors, networkError }) => {
      // Log better error messages to console
      if (graphQLErrors) {
        graphQLErrors.map(({ message, locations, path }) =>
          console.log(
            `[GraphQL error]: Message: ${message}, Location: ${locations}, Path: ${path}`
          )
        )
      }
      if (networkError) console.log(`[Network error]: ${networkError}`)
    }),
    httpLink
  ]),
  cache: new InMemoryCache()
})

export default client
