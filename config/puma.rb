# frozen_string_literal: true
threads_count = ENV.fetch('HANAMI_MAX_THREADS') { 5 }.to_i
threads threads_count, threads_count

port        ENV.fetch('PORT') { 3000 }
environment ENV.fetch('HANAMI_ENV') { 'development' }

workers ENV.fetch('WEB_CONCURRENCY') { 2 }
