angular.module('app.routes', [])

.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider
    
  

      .state('tabsController.operaO', {
    url: '/page2',
    views: {
      'tab1': {
        templateUrl: 'templates/operaO.html',
        controller: 'operaOCtrl'
      }
    }
  })

  .state('tabsController.bDT', {
    url: '/page3',
    views: {
      'tab2': {
        templateUrl: 'templates/bDT.html',
        controller: 'bDTCtrl'
      }
    }
  })

  .state('tabsController.configuraEs', {
    url: '/page4',
    views: {
      'tab3': {
        templateUrl: 'templates/configuraEs.html',
        controller: 'configuraEsCtrl'
      }
    }
  })

  .state('tabsController', {
    url: '/page1',
    templateUrl: 'templates/tabsController.html',
    abstract:true
  })

  .state('tabsController.iniciarTurno', {
    url: '/page6',
    views: {
      'tab1': {
        templateUrl: 'templates/iniciarTurno.html',
        controller: 'iniciarTurnoCtrl'
      }
    }
  })

  .state('tabsController.finalizarTurno', {
    url: '/page9',
    views: {
      'tab1': {
        templateUrl: 'templates/finalizarTurno.html',
        controller: 'finalizarTurnoCtrl'
      }
    }
  })

  .state('tabsController.inspeODiRia', {
    url: '/page7',
    views: {
      'tab1': {
        templateUrl: 'templates/inspeODiRia.html',
        controller: 'inspeODiRiaCtrl'
      }
    }
  })

  .state('tabsController.refeiO', {
    url: '/page10',
    views: {
      'tab1': {
        templateUrl: 'templates/refeiO.html',
        controller: 'refeiOCtrl'
      }
    }
  })

  .state('tabsController.paradasOperacionais', {
    url: '/page13',
    views: {
      'tab1': {
        templateUrl: 'templates/paradasOperacionais.html',
        controller: 'paradasOperacionaisCtrl'
      }
    }
  })

  .state('tabsController.outrasParadas', {
    url: '/page14',
    views: {
      'tab1': {
        templateUrl: 'templates/outrasParadas.html',
        controller: 'outrasParadasCtrl'
      }
    }
  })

  .state('tabsController.manutenO', {
    url: '/page15',
    views: {
      'tab1': {
        templateUrl: 'templates/manutenO.html',
        controller: 'manutenOCtrl'
      }
    }
  })

  .state('tabsController.abastecimento', {
    url: '/page12',
    views: {
      'tab1': {
        templateUrl: 'templates/abastecimento.html',
        controller: 'abastecimentoCtrl'
      }
    }
  })

  .state('tabsController.detalhamentoDaManutenO', {
    url: '/page16',
    views: {
      'tab1': {
        templateUrl: 'templates/detalhamentoDaManutenO.html',
        controller: 'detalhamentoDaManutenOCtrl'
      }
    }
  })

  .state('tabsController.trocarFerramentaDeCorte', {
    url: '/page11',
    views: {
      'tab1': {
        templateUrl: 'templates/trocarFerramentaDeCorte.html',
        controller: 'trocarFerramentaDeCorteCtrl'
      }
    }
  })

  .state('tabsController.cortarMadeira', {
    url: '/page8',
    views: {
      'tab1': {
        templateUrl: 'templates/cortarMadeira.html',
        controller: 'cortarMadeiraCtrl'
      }
    }
  })

$urlRouterProvider.otherwise('/page1/page2')

  

});