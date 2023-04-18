module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/components/**/*',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('@tailwindcss/forms')
  ],
  theme: {
    extend: {
      width: {
        '128': '32rem'
      },
      height: {
        '128': '32rem',
      },
      colors: {
        'dark-blue': '#345890',
        'light-blue': '#A1B1CB',
        'very-light-blue': '#D9E2EC',
        'light-purple': '#827F9B',
        'postit-yellow': '#FFFCDC',
        'light-black': '#3E3E3E',
        'cyan-blue': '#1FB9E8',
        'light-grey': '#f2f2f2',
        'danger-100': '#FEF2F2',
        'danger-200': '#fff3f3',
        'danger-500': '#F37B7B',
        'danger-600': '#d26969'
      }
    }
  }
}
